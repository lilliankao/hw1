-- In this assignment, you'll be building the domain model, database 
-- structure, and data for "KMDB" (the Kellogg Movie Database).
-- The end product will be a report that prints the movies and the 
-- top-billed cast for each movie in the database.

-- Requirements/assumptions
--
-- - There will only be three movies in the database – the three films
--   that make up Christopher Nolan's Batman trilogy.
-- - Movie data includes the movie title, year released, MPAA rating,
--   and studio.
-- - There are many studios, and each studio produces many movies, but
--   a movie belongs to a single studio.
-- - An actor can be in multiple movies.
-- - Everything you need to do in this assignment is marked with TODO!
-- - Note rubric explanation for appropriate use of external resources.

-- User stories
--
-- - As a guest, I want to see a list of movies with the title, year released,
--   MPAA rating, and studio information.
-- - As a guest, I want to see the movies which a single studio has produced.
-- - As a guest, I want to see each movie's cast including each actor's
--   name and the name of the character they portray.
-- - As a guest, I want to see the movies which a single actor has acted in.
-- * Note: The "guest" user role represents the experience prior to logging-in
--   to an app and typically does not have a corresponding database table.


-- Deliverables
-- 
-- There are three deliverables for this assignment, all delivered via
-- this file and submitted via GitHub and Canvas:
-- - A domain model, implemented via CREATE TABLE statements for each
--   model/table. Also, include DROP TABLE IF EXISTS statements for each
--   table, so that each run of this script starts with a blank database.
-- - Insertion of "Batman" sample data into tables.
-- - Selection of data, so that something similar to the sample "report"
--   below can be achieved.

-- Rubric
--
-- 1. Domain model - 6 points
-- - Think about how the domain model needs to reflect the
--   "real world" entities and the relationships with each other. 
--   Hint #1: It's not just a single table that contains everything in the 
--   expected output. There are multiple real world entities and
--   relationships including at least one many-to-many relationship.
--   Hint #2: Do NOT name one of your models/tables “cast” or “casts”; this 
--   is a reserved word in sqlite and will break your database! Instead, 
--   think of a better word to describe this concept; i.e. the relationship 
--   between an actor and the movie in which they play a part.
-- 2. Execution of the domain model (CREATE TABLE) - 4 points
-- - Follow best practices for table and column names
-- - Use correct data column types (i.e. TEXT/INTEGER)
-- - Use of the `model_id` naming convention for foreign key columns
-- 3. Insertion of data (INSERT statements) - 4 points
-- - Insert data into all the tables you've created
-- - It actually works, i.e. proper INSERT syntax
-- 4. "The report" (SELECT statements) - 6 points
-- - Write 2 `SELECT` statements to produce something similar to the
--   sample output below - 1 for movies and 1 for cast. You will need
--   to read data from multiple tables in each `SELECT` statement.
--   Formatting does not matter.
-- 5. Using external resources for help with the assignment (including colleagues, AI, internet search, etc):
-- - Engineers look to colleagues and the internet all the time when building software.
--   You are welcome to do the same. However, the solution you submit must utilize
--   the skills and strategies covered in class. Alternate solutions which do not demonstrate
--   an understanding of the approaches used in class will receive significant deductions.
--   Any concern should be raised with faculty prior to assignment due date.

-- Submission
-- 
-- - "Use this template" to create a brand-new "hw1" repository in your
--   personal GitHub account, e.g. https://github.com/<USERNAME>/hw1
-- - Do the assignment, committing and syncing often
-- - When done, commit and sync a final time, before submitting the GitHub
--   URL for the finished "hw1" repository as the "Website URL" for the 
--   Homework 1 assignment in Canvas

-- Successful sample output is as shown:

-- Movies
-- ======

-- Batman Begins          2005           PG-13  Warner Bros.
-- The Dark Knight        2008           PG-13  Warner Bros.
-- The Dark Knight Rises  2012           PG-13  Warner Bros.

-- Top Cast
-- ========

-- Batman Begins          Christian Bale        Bruce Wayne
-- Batman Begins          Michael Caine         Alfred
-- Batman Begins          Liam Neeson           Ra's Al Ghul
-- Batman Begins          Katie Holmes          Rachel Dawes
-- Batman Begins          Gary Oldman           Commissioner Gordon
-- The Dark Knight        Christian Bale        Bruce Wayne
-- The Dark Knight        Heath Ledger          Joker
-- The Dark Knight        Aaron Eckhart         Harvey Dent
-- The Dark Knight        Michael Caine         Alfred
-- The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
-- The Dark Knight Rises  Christian Bale        Bruce Wayne
-- The Dark Knight Rises  Gary Oldman           Commissioner Gordon
-- The Dark Knight Rises  Tom Hardy             Bane
-- The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
-- The Dark Knight Rises  Anne Hathaway         Selina Kyle

-- Turns column mode on but headers off
.mode column
.headers off

-- Drop existing tables, so you'll start fresh each time this script is run.
DROP TABLE IF EXISTS Studios;

DROP TABLE IF EXISTS Movies;

DROP TABLE IF EXISTS Characters;

DROP TABLE IF EXISTS Actors;

DROP TABLE IF EXISTS Moviecasts;

-- Create new tables, according to your domain model
CREATE TABLE Studios (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT
);

CREATE TABLE Movies (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  year TEXT,
  rating TEXT,
  studio_id INTEGER
);


CREATE TABLE Characters (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT
);

CREATE TABLE Actors (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT
);


CREATE TABLE Moviecasts (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  character_id INTEGER,
  actor_id INTEGER,
  movie_id INTEGER
);

-- Insert data into your database that reflects the sample data shown above
-- Use hard-coded foreign key IDs when necessary
INSERT INTO Studios (
    name
)

VALUES (
    "Warner Bros."
);

INSERT INTO Movies (
    name,
    year,
    rating,
    studio_id
)

VALUES (
    "Batman Begins",
    "2005",
    "PG-13",
    "1"
);

INSERT INTO Movies (
    name,
    year,
    rating,
    studio_id
)

VALUES (
    "The Dark Night",
    "2008",
    "PG-13",
    "1"
);

INSERT INTO Movies (
    name,
    year,
    rating,
    studio_id
)

VALUES (
    "The Dark Night Rises",
    "2012",
    "PG-13",
    "1"
);

INSERT INTO Characters (name)
VALUES ("Bruce Wayne"),("Alfred"),
("Ra's Al Ghul"),("Rachel Dawes"),
("Commissioner Gordon"),("Joker"),
("Harvey Dent"),("Bane"),
("John Blake"),("Selina Kyle");

INSERT INTO Actors (name)
VALUES ("Christian Bale"),("Michael Caine"),
("Liam Neeson"),("Katie Holmes"),
("Gary Oldman"),("Health Ledger"),
("Aaron Eckhart"),("Maggie Gyllenhaal"),
("Tom Hardy"),("Joseph Gordon-Levitt"),
("Anne Hathaway");

INSERT INTO Moviecasts (character_id,actor_id,movie_id)
VALUES (1,1,1),(1,1,2),
(1,1,3),(2,2,1),(2,2,2),(3,3,1),
(4,4,1),(5,5,1),(5,5,3),(6,6,2),
(7,7,2),(4,8,2),(8,9,3),(9,10,3),
(10,11,3)
;


-- Prints a header for the movies output
.print "Movies"
.print "======"
.print ""

-- The SQL statement for the movies output
SELECT Movies.name, Movies.year, Movies.rating, Studios.name 
FROM Movies INNER JOIN Studios ON Movies.studio_id = Studios.id
WHERE Studios.name = "Warner Bros."
;


-- Prints a header for the cast output
.print ""
.print "Top Cast"
.print "========"
.print ""


-- The SQL statement for the cast output

SELECT Movies.name, Actors.name, Characters.name
FROM Movies
INNER JOIN Moviecasts ON Movies.id = Moviecasts.movie_id
INNER JOIN Characters ON Moviecasts.character_id = Characters.id
INNER JOIN Actors ON Moviecasts.actor_id = Actors.id
INNER JOIN Studios ON Studios.id = Movies.studio_id
WHERE Studios.name = "Warner Bros."
ORDER BY Movies.name;

