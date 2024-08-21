-- ASSIGNMENT 3
-- Scenario of use: 
-- This project simulates the process of setting up a new tennis tournament,
-- registering players, scheduling matches, recording match results, 
-- updating player rankings, tournament outcomes and player statistics.
-- This system can be used by tournament organisers to efficiently manage 
-- all aspects of the tournament and to assess player performance and rankings.

CREATE DATABASE TOURNAMENTAL_TENNIS;
USE TOURNAMENTAL_TENNIS;


-- Create a database with 4 tables with several columns (players, tournaments, matches, rankings)
-- Link tables using primary and foreign keys effectively
-- Different data types used while creating tables  - INT (integer), VARCHAR (variable-length strings), DATE
-- Constraints used while creating tables - UNIQUE (ensures that all values in a column are different),  NOT NULL (ensures that a column cannot have a NULL value)


CREATE TABLE players(
	player_id INT PRIMARY KEY AUTO_INCREMENT UNIQUE NOT NULL,
    first_name VARCHAR(55) NOT NULL,
    last_name VARCHAR(55) NOT NULL,
    birthdate DATE NOT NULL,
    nationality VARCHAR(55),
    ranking INT
);

-- INSERT query used to insert dummy data into players table
INSERT INTO players (first_name, last_name, birthdate, nationality, ranking) VALUES
('John', 'Doe', '1990-01-01', 'USA', 1),
('Jane', 'Smith', '1992-02-02', 'UK', 2),
('Carlos', 'Garcia', '1988-03-03', 'Spain', 3),
('Maria', 'Lopez', '1995-04-04', 'Argentina', 4),
('Anna', 'Ivanova', '1993-05-05', 'Russia', 5),
('Chen', 'Wei', '1991-06-06', 'China', 6),
('Tom', 'Brown', '1989-07-07', 'Australia', 7),
('Laura', 'White', '1994-08-08', 'Canada', 8);


CREATE TABLE tournaments(
	tournament_id INT PRIMARY KEY AUTO_INCREMENT UNIQUE NOT NULL,
    tournament_name VARCHAR(100) UNIQUE NOT NULL,
    location VARCHAR(55) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    prize_money INT NOT NULL
);

-- INSERT query used to insert dummy data into tournaments table
INSERT INTO tournaments (tournament_name, location, start_date, end_date, prize_money) VALUES
('Grand Slam', 'New York', '2023-01-01', '2023-01-10', 1000000),
('Open Championship', 'London', '2023-02-01', '2023-02-10', 800000),
('World Cup', 'Paris', '2023-03-01', '2023-03-10', 900000),
('International Open', 'Tokyo', '2023-04-01', '2023-04-10', 700000),
('National Cup', 'Sydney', '2023-05-01', '2023-05-10', 600000),
('Champions League', 'Berlin', '2023-06-01', '2023-06-10', 750000),
('Masters Tournament', 'Madrid', '2023-07-01', '2023-07-10', 850000),
('Pro Tour', 'Rome', '2023-08-01', '2023-08-10', 650000);


CREATE TABLE matches(
	match_id INT PRIMARY KEY AUTO_INCREMENT UNIQUE NOT NULL,
    tournament_id INT NOT NULL,
    player1_id INT NOT NULL,
    player2_id INT NOT NULL,
    match_date DATE NOT NULL,
    round VARCHAR(55) NOT NULL,
    score VARCHAR(20) NOT NULL,
    
    FOREIGN KEY (tournament_id) REFERENCES tournaments(tournament_id),
    FOREIGN KEY (player1_id) REFERENCES players(player_id),
    FOREIGN KEY (player2_id) REFERENCES players(player_id)
);

-- INSERT query used to insert dummy data into matches table
INSERT INTO matches (tournament_id, player1_id, player2_id, match_date, round, score) VALUES
-- Tournament 1
(1, 1, 2, '2023-01-02', 'Semifinals', '6-3, 6-4'),
(1, 3, 4, '2023-01-03', 'Finals', '7-5, 6-2'),

-- Tournament 2
(2, 5, 6, '2023-02-02', 'Semifinals', '6-4, 3-6, 6-4'),
(2, 7, 8, '2023-02-03', 'Finals', '7-6, 6-7, 7-5'),

-- Tournament 3
(3, 1, 3, '2023-03-02', 'Semifinals', '6-3, 6-2'),
(3, 2, 4, '2023-03-03', 'Finals', '6-4, 7-5'),

-- Tournament 4
(4, 5, 7, '2023-04-02', 'Semifinals', '6-1, 6-2'),
(4, 6, 8, '2023-04-03', 'Finals', '6-3, 7-6'),

-- Tournament 5
(5, 1, 2, '2023-05-02', 'Semifinals', '6-2, 6-3'),
(5, 3, 4, '2023-05-03', 'Finals', '6-4, 6-4'),

-- Tournament 6
(6, 5, 6, '2023-06-01', 'Semifinals', '6-3, 3-6, 6-4'),
(6, 7, 8, '2023-06-02', 'Finals', '7-5, 6-7, 6-4'),

-- Tournament 7
(7, 1, 3, '2023-07-01', 'Semifinals', '6-1, 6-2'),
(7, 2, 4, '2023-07-02', 'Finals', '7-6, 6-4'),

-- Tournament 8
(8, 5, 7, '2023-08-01', 'Semifinals', '6-3, 6-2'),
(8, 6, 8, '2023-08-02', 'Finals', '4-6, 7-5, 6-4');


CREATE TABLE rankings (
	ranking_id INT PRIMARY KEY AUTO_INCREMENT UNIQUE NOT NULL,
    player_id INT NOT NULL,
    tournament_id INT NOT NULL,
    tournament_rank INT NOT NULL,
    -- stores the rank or position that the player achieved in the tournament. It's an integer representing the top 2 player's from the tournaent and their position, 1 for first place, 2 for second place
    points INT,
    -- stores the number of points the player earned for their performance in the tournament
    FOREIGN KEY (player_id) REFERENCES players(player_id),
    FOREIGN KEY (tournament_id) REFERENCES tournaments(tournament_id)
);

-- INSERT query used to insert dummy data into rankings table for all 8 tournaments, storing data for top 2 players each tournament, and points earned
INSERT INTO Rankings (player_id, tournament_id, tournament_rank, points) VALUES
-- -- Tournament 1
(1, 1, 1, 1000),
(2, 1, 2, 800),
-- Tournament 2
(3, 2, 1, 900),
(4, 2, 2, 700),
-- Tournament 3
(5, 3, 1, 950),
(6, 3, 2, 850),
-- Tournament 4
(7, 4, 1, 920),
(8, 4, 2, 820),
-- Tournament 5
(1, 5, 1, 880),
(2, 5, 2, 760),
-- Tournament 6
(3, 6, 1, 940),
(4, 6, 2, 820),
-- Tournament 7
(5, 7, 1, 960),
(6, 7, 2, 840),
-- Tournament 8
(7, 8, 1, 970),
(8, 8, 2, 850);


--  DATA QUERIES:


-- -- 1. List players names with UK nationailty, concatenating the first and last names
-- SELECT CONCAT(p.first_name, ' ', p.last_name) AS 'player name'	
-- FROM players p
-- WHERE p.nationality = 'UK';


-- -- 2. Get the matches data of 'Masters Tournament', listing most recently played match first
-- SELECT * 
-- FROM matches 
-- WHERE tournament_id = (
--     SELECT t.tournament_id
--     FROM tournaments t
--     WHERE t.tournament_name = 'Masters Tournament'
-- )
-- ORDER BY match_date DESC;
-- -- descending list with most recently played match first


-- -- 3. Get the list of all tournaments names, locations and prize money where prize money is 750000 and above 
-- SELECT 
-- 	t.tournament_name,
--     t.location,
--     t.prize_money
-- FROM tournaments t
-- WHERE t.prize_money >= 750000
-- ORDER BY t.prize_money ASC;
-- -- return in ascending order of prize monies (lowest to highest)


-- -- 4. Get the top 3 players based on their overall ranking points 
-- SELECT 
-- 	p.first_name, 
--  p.last_name, 
-- SUM(r.points) AS total_points
-- -- total the players ranking points using aggregate function (SUM)
-- FROM players p
-- INNER JOIN rankings r ON p.player_id = r.player_id
-- -- use an inner join between players and rankings tables
-- -- match records where player_id in players table is equal to player_id in rankings table
-- GROUP BY p.player_id
-- -- group the results by player_id to calculate sum of points for each player
-- ORDER BY total_points DESC
-- -- return top 3 (descending order from highest) 
-- LIMIT 3;
-- -- limit returned data to top 3 players


-- -- 5. Get the average prize money from the tournaments
-- SELECT 
-- AVG(t.prize_money)
-- -- use AVG aggregate funtion to find average
-- FROM tournaments t;


-- -- 6. Get the players and score from the finals of the 'Open Championship' tournament
-- SELECT 
-- 	m.round,
--     m.player1_id,
--     m.player2_id,
--     m.score
-- FROM matches m
--   WHERE m.round = 'Finals'
-- AND tournament_id = (
-- 	SELECT t.tournament_id
--     FROM tournaments t
--     WHERE t.tournament_name = 'Open Championship'
-- );


-- -- 7. DELETE player who is disqualified from tournaments (delete player with player_id = 1)
-- -- delete the player's rankings
-- DELETE FROM rankings WHERE player_id = 1;
-- -- delete the player's matches (as player1 or player2)
-- DELETE FROM matches WHERE player1_id = 1 OR player2_id = 1;
-- -- delete the player from the players table
-- DELETE FROM players WHERE player_id = 1;


-- 8. Get the average age of the players
	-- get ages of players in years:
-- SELECT 
-- 	p.first_name,
--     p.last_name,
--     p.birthdate,
--     year(CURDATE())-year(p.birthdate) as age
--     -- CURDATE() function gets today's date
--      -- the year() function takes the year from a date (current year and year of birthdate)
--     -- calculate player's ages by subtracting the year part of the player's birthdate from the current year
-- FROM players p;
-- 	-- get average age of all players:
-- SELECT
-- 	AVG(year(CURDATE())-year(p.birthdate)) as player_average_age
-- FROM players p;


-- -- 9. Get detailed match information including player names and tournament details
-- SELECT 
--     m.match_id,
--     t.tournament_name,
--     CONCAT(p1.first_name, ' ', p1.last_name) AS player1_name,
--     CONCAT(p2.first_name, ' ', p2.last_name) AS player2_name,
--     m.match_date,
--     m.round,
--     m.score
-- FROM matches m
-- INNER JOIN tournaments t ON m.tournament_id = t.tournament_id
-- -- join tournaments table to get tournament details
-- INNER JOIN players p1 ON m.player1_id = p1.player_id
-- -- join players table to get details for player 1
-- INNER JOIN players p2 ON m.player2_id = p2.player_id
-- -- join players table to get details for player 2
-- ORDER BY m.match_date DESC;
-- -- order results by match date in descending order


-- -- 10. Create a stored procedure to insert a new player
-- DELIMITER //

-- CREATE PROCEDURE InsertPlayer (
--     IN first_name VARCHAR(55),
--     IN last_name VARCHAR(55),
--     IN birthdate DATE,
--     IN nationality VARCHAR(55),
--     IN ranking INT
-- )
-- BEGIN
--     INSERT INTO players (first_name, last_name, birthdate, nationality, ranking)
--     VALUES (first_name, last_name, birthdate, nationality, ranking);
-- END //

-- DELIMITER ;

-- -- call stored procedure to insert new player
-- CALL InsertPlayer ('Hannah', 'Curran', '1990-10-08', 'UK', 1);


-- -- 11.  Normalise the DB to separate player nationality into its own table
-- CREATE TABLE nationalities (
--     nationality_id INT PRIMARY KEY AUTO_INCREMENT UNIQUE NOT NULL,
--     country VARCHAR(55) UNIQUE NOT NULL
-- );
-- 	-- insert nationalities
-- INSERT INTO nationalities (country) VALUES
-- ('USA'),
-- ('UK'),
-- ('Spain'),
-- ('Argentina'),
-- ('Russia'),
-- ('China'),
-- ('Australia'),
-- ('Canada');

-- 	-- update players table to reference nationalities table
-- ALTER TABLE players
-- ADD nationality_id INT,
-- DROP COLUMN nationality,
-- ADD FOREIGN KEY (nationality_id) REFERENCES nationalities(nationality_id);

-- 	-- update the INSERT statements to include the nationality_id
-- INSERT INTO players (first_name, last_name, birthdate, nationality_id, ranking) VALUES
-- ('John', 'Doe', '1990-01-01', 1, 1),
-- ('Jane', 'Smith', '1992-02-02', 2, 2),
-- ('Carlos', 'Garcia', '1988-03-03', 3, 3),
-- ('Maria', 'Lopez', '1995-04-04', 4, 4),
-- ('Anna', 'Ivanova', '1993-05-05', 5, 5),
-- ('Chen', 'Wei', '1991-06-06', 6, 6),
-- ('Tom', 'Brown', '1989-07-07', 7, 7),
-- ('Laura', 'White', '1994-08-08', 8, 8);


