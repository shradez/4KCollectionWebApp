DROP SCHEMA IF EXISTS public CASCADE;
CREATE SCHEMA public;

GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO public;

CREATE TABLE IF NOT EXISTS directors (
        director_id serial PRIMARY KEY,
        first_name VARCHAR (32),
        last_name VARCHAR (32) NOT NULL, /* last name not null in case person goes by one-word moniker, in the event we'd sort names, we'd probably sort by last name */
        gender CHAR (1)
);

CREATE TABLE IF NOT EXISTS actors (
        actor_id serial PRIMARY KEY,
        first_name VARCHAR (32),
        last_name VARCHAR (32) NOT NULL, /* last name not null in case person goes by one-word moniker, in the event we'd sort names, we'd probably sort by last name */
        gender CHAR (1)
);

CREATE TABLE IF NOT EXISTS genres (
        genre_id serial PRIMARY KEY,
        genre_name VARCHAR (16) NOT NULL
);

CREATE TABLE IF NOT EXISTS movies (
        movie_id serial PRIMARY KEY,
        title VARCHAR (64) NOT NULL,
        release_year INT NOT NULL,
        mpaa_rating VARCHAR (8),
        runtime_in_min INT NOT NULL,
        summary VARCHAR (256),
        imdb_score DECIMAL (2,1) NOT NULL,
        metacritic_score INT NOT NULL,
        has_nate_watched BOOLEAN NOT NULL,
        nate_score INT
);

CREATE TABLE IF NOT EXISTS movie_genres (
       movie_id INT NOT NULL,
       genre_id INT NOT NULL,
       PRIMARY KEY (movie_id, genre_id),
       FOREIGN KEY (movie_id)
               REFERENCES movies (movie_id),
       FOREIGN KEY (genre_id)
               REFERENCES genres (genre_id)
);

CREATE TABLE IF NOT EXISTS movie_actors (
        movie_id INT NOT NULL,
        actor_id INT NOT NULL,
        PRIMARY KEY (movie_id, actor_id),
        FOREIGN KEY (movie_id)
                REFERENCES movies (movie_id),
        FOREIGN KEY (actor_id)
                REFERENCES actors (actor_id)
);

CREATE TABLE IF NOT EXISTS movie_directors (
        movie_id INT NOT NULL,
        director_id INT NOT NULL,
        PRIMARY KEY (movie_id, director_id),
        FOREIGN KEY (movie_id)
                REFERENCES movies (movie_id),
        FOREIGN KEY (director_id)
                REFERENCES directors (director_id)
);

BEGIN TRANSACTION;

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched, nate_score)
VALUES ('1917', 2019, 'R', 119, 'April 6th, 1917. As a regiment assembles to wage war deep in enemy territory, two soldiers are assigned to race against time and deliver a message that will stop 1,600 men from walking straight into a deadly trap.', 8.3, 78, true, 9);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched, nate_score)
VALUES ('Ad Astra', 2019, 'PG-13', 123, 'Astronaut Roy McBride undertakes a mission across an unforgiving solar system to uncover the truth about his missing father and his doomed expedition that now, 30 years later, threatens the universe.', 6.5, 80, true, 8);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched)
VALUES ('Alien: Covenant', 2017, 'R', 122, 'The crew of a colony ship, bound for a remote planet, discover an uncharted paradise with a threat beyond their imagination, and must attempt a harrowing escape.', 6.4, 65, false);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched, nate_score)
VALUES ('Arrival', 2016, 'PG-13', 116, 'A linguist works with the military to communicate with alien lifeforms after twelve mysterious spacecraft appear around the world.', 7.9, 81, true, 9);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched, nate_score)
VALUES ('Annihilation', 2018, 'R', 115, 'A biologist signs up for a dangerous, secret expedition into a mysterious zone where the laws of nature don''t apply.', 6.8, 79, true, 9);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched, nate_score)
VALUES ('Aquaman', 2018, 'PG-13', 143, 'Arthur Curry, the human-born heir to the underwater kingdom of Atlantis, goes on a quest to prevent a war between the worlds of ocean and land.', 6.9, 55, true, 3);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched)
VALUES ('BlacKkKlansman', 2018, 'R', 135, 'Ron Stallworth, an African American police officer from Colorado Springs, CO, successfully manages to infiltrate the local Ku Klux Klan branch with the help of a Jewish surrogate who eventually becomes its leader. Based on actual events.', 7.5, 83, false);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched, nate_score)
VALUES ('Blade Runner 2049', 2017, 'PG-13', 164, 'Young Blade Runner K''s discovery of a long-buried secret leads him to track down former Blade Runner Rick Deckard, who''s been missing for thirty years.', 8.0, 81, true, 10);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched, nate_score)
VALUES ('Casino Royale', 2006, 'PG-13', 144, 'After earning 00 status and a license to kill, Secret Agent James Bond sets out on his first mission as 007. Bond must defeat a private banker funding terrorists in a high-stakes game of poker at Casino Royale, Montenegro.', 8.0, 80, true, 10);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched, nate_score)
VALUES ('Quantum of Solace', 2008, 'PG-13', 106, 'James Bond descends into mystery as he tries to stop a mysterious organisation from eliminating a country''s most valuable resource.', 6.6, 58, true, 7);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched, nate_score)
VALUES ('Skyfall', 2012, 'PG-13', 143, 'James Bond''s loyalty to M is tested when her past comes back to haunt her. When MI6 comes under attack, 007 must track down and destroy the threat, no matter how personal the cost.', 7.7, 81, true, 8);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched, nate_score)
VALUES ('Spectre', 2015, 'PG-13', 148, 'A cryptic message from James Bond''s past sends him on a trail to uncover the existence of a sinister organisation named SPECTRE. With a new threat dawning, Bond learns the terrible truth about the author of all his pain in his most recent missions.', 6.8, 60, true, 7);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched, nate_score)
VALUES ('Batman Begins', 2005, 'PG-13', 140, 'After training with his mentor, Batman begins his fight to free crime-ridden Gotham City from corruption.', 8.2, 70, true, 7);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched, nate_score)
VALUES ('The Dark Knight', 2008, 'PG-13', 152, 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.', 9.0, 84, true, 10);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched, nate_score)
VALUES ('The Dark Knight Rises', 2012, 'PG-13', 164, 'Eight years after the Joker''s reign of anarchy, Batman, with the help of the enigmatic Catwoman, is forced from his exile to save Gotham City from the brutal guerrilla terrorist Bane.', 8.4, 78, true, 7);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched, nate_score)
VALUES ('Deadpool', 2016, 'R', 108, 'A wisecracking mercenary gets experimented on and becomes immortal but ugly, and sets out to track down the man who ruined his looks.', 8.0, 65, true, 7);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched, nate_score)
VALUES ('Pokemon Detective Pikachu', 2019, 'PG', 104, 'In a world where people collect Pokémon to do battle, a boy comes across an intelligent talking Pikachu who seeks to be a detective.', 6.6, 53, true, 7);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched, nate_score)
VALUES ('Dunkirk', 2017, 'PG-13', 106, 'Allied soldiers from Belgium, the British Commonwealth and Empire, and France are surrounded by the German Army and evacuated during a fierce battle in World War II.', 7.8, 94, true, 9);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched)
VALUES ('Fury', 2014, 'R', 134, 'A grizzled tank commander makes tough decisions as he and his crew fight their way across Germany in April, 1945.', 7.6, 64, false);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched, nate_score)
VALUES ('Fantastic Beasts and Where to Find Them', 2016, 'PG-13', 132, 'The adventures of writer Newt Scamander in New York''s secret community of witches and wizards seventy years before Harry Potter reads his book in school.', 7.3, 66, true, 7);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched, nate_score)
VALUES ('Fantastic Beasts: The Crimes of Grindelwald', 2018, 'PG-13', 134, 'The second installment of the "Fantastic Beasts" series featuring the adventures of Magizoologist Newt Scamander.', 6.5, 52, true, 6);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched)
VALUES ('Ghost in the Shell', 1995, 'TV-MA', 83, 'A cyborg policewoman and her partner hunt a mysterious and powerful hacker called the Puppet Master.', 8.0, 76, false);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched, nate_score)
VALUES ('The Hunger Games', 2012, 'PG-13', 142, 'Katniss Everdeen voluntarily takes her younger sister''s place in the Hunger Games: a televised competition in which two teenagers from each of the twelve Districts of Panem are chosen at random to fight to the death.', 7.2, 68, true, 8);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched, nate_score)
VALUES ('Inception', 2010, 'PG-13', 148, 'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.', 8.8, 74, true, 10);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched, nate_score)
VALUES ('Inferno', 2016, 'PG-13', 121, 'When Robert Langdon wakes up in an Italian hospital with amnesia, he teams up with Dr. Sienna Brooks, and together they must race across Europe against the clock to foil a deadly global plot.', 6.2, 42, true, 5);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched, nate_score)
VALUES ('Interstellar', 2014, 'PG-13', 169, 'A team of explorers travel through a wormhole in space in an attempt to ensure humanity''s survival.', 8.6, 74, true, 10);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched, nate_score)
VALUES ('John Wick', 2014, 'R', 101, 'An ex-hit-man comes out of retirement to track down the gangsters that killed his dog and took everything from him.', 7.4, 68, true, 7);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched, nate_score)
VALUES ('John Wick: Chapter 2', 2017, 'R', 122, 'After returning to the criminal underworld to repay a debt, John Wick discovers that a large bounty has been put on his life.', 7.5, 75, true, 7);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched, nate_score)
VALUES ('Joker', 2019, 'R', 122, 'In Gotham City, mentally troubled comedian Arthur Fleck is disregarded and mistreated by society. He then embarks on a downward spiral of revolution and bloody crime. This path brings him face-to-face with his alter-ego: the Joker.', 8.4, 59, true, 9);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched, nate_score)
VALUES ('Knives Out', 2019, 'PG-13', 130, 'A detective investigates the death of a patriarch of an eccentric, combative family.', 7.9, 82, true, 7);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched, nate_score)
VALUES ('Logan', 2017, 'R', 137, 'In a future where mutants are nearly extinct, an elderly and weary Logan leads a quiet life. But when Laura, a mutant child pursued by scientists, comes to him for help, he must get her to safety.', 8.1, 77, true, 8);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched, nate_score)
VALUES ('The Lord of the Rings: The Fellowship of the Ring (Extended)', 2001, 'PG-13', 228, 'A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle-earth from the Dark Lord Sauron.', 8.8, 92, true, 10);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched, nate_score)
VALUES ('The Lord of the Rings: The Two Towers (Extended)', 2002, 'PG-13', 235, 'While Frodo and Sam edge closer to Mordor with the help of the shifty Gollum, the divided fellowship makes a stand against Sauron''s new ally, Saruman, and his hordes of Isengard.', 8.7, 87, true, 10);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched, nate_score)
VALUES ('The Lord of the Rings: The Return of the King (Extended)', 2003, 'PG-13', 263, 'Gandalf and Aragorn lead the World of Men against Sauron''s army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring.', 8.9, 94, true, 10);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched, nate_score)
VALUES ('The Matrix', 1999, 'R', 136, 'When a beautiful stranger leads computer hacker Neo to a forbidding underworld, he discovers the shocking truth--the life he knows is the elaborate deception of an evil cyber-intelligence.', 8.7, 73, true, 8);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched, nate_score)
VALUES ('Mission Impossible: Fallout', 2018, 'PG-13', 147, 'Ethan Hunt and his IMF team, along with some familiar allies, race against time after a mission gone wrong.', 7.7, 86, true, 9);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched, nate_score)
VALUES ('Mission Impossible: Rogue Nation', 2015, 'PG-13', 131, 'Ethan and his team take on their most impossible mission yet when they have to eradicate an international rogue organization as highly skilled as they are and committed to destroying the IMF.', 7.4, 75, true, 8);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched)
VALUES ('Oblivion', 2013, 'PG-13', 124, 'A veteran assigned to extract Earth''s remaining resources begins to question what he knows about his mission and himself.', 7.0, 54, false);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched, nate_score)
VALUES ('Pan''s Labyrinth', 2006, 'R', 118, 'In the Falangist Spain of 1944, the bookish young stepdaughter of a sadistic army officer escapes into an eerie but captivating fantasy world.', 8.2, 98, true, 9);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched)
VALUES ('Parasite', 2019, 'R', 132, 'Greed and class discrimination threaten the newly formed symbiotic relationship between the wealthy Park family and the destitute Kim clan.', 8.6, 96, false);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched, nate_score)
VALUES ('Phantom Thread', 2017, 'R', 130, 'Set in 1950s London, Reynolds Woodcock is a renowned dressmaker whose fastidious life is disrupted by a young, strong-willed woman, Alma, who becomes his muse and lover.', 7.5, 90, true, 8);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched, nate_score)
VALUES ('Pirates of the Caribbean: Dead Men Tell No Tales', 2017, 'PG-13', 129, 'Captain Jack Sparrow is pursued by old rival Captain Salazar and a crew of deadly ghosts who have escaped from the Devil''s Triangle. They''re determined to kill every pirate at sea...notably Jack.', 6.5, 39, true, 6);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched, nate_score)
VALUES ('Ratatouille', 2007, 'G', 111, 'A rat who can cook makes an unusual alliance with a young kitchen worker at a famous restaurant.', 6.5, 96, true, 10);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched, nate_score)
VALUES ('The Revenant', 2018, 'R', 156, 'A frontiersman on a fur trading expedition in the 1820s fights for survival after being mauled by a bear and left for dead by members of his own hunting team.', 8.0, 76, true, 8);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched)
VALUES ('The Shallows', 2016, 'PG-13', 86, 'A mere 200 yards from shore, surfer Nancy is attacked by a great white shark, with her short journey to safety becoming the ultimate contest of wills.', 6.3, 59, false);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched, nate_score)
VALUES ('Sicario', 2015, 'R', 121, 'An idealistic FBI agent is enlisted by a government task force to aid in the escalating war against drugs at the border area between the U.S. and Mexico.', 7.6, 82, true, 9);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched, nate_score)
VALUES ('Sonic the Hedgehog', 2020, 'PG', 99, 'After discovering a small, blue, fast hedgehog, a small-town police officer must help him defeat an evil genius who wants to do experiments on him.', 6.5, 47, true, 7);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched, nate_score)
VALUES ('Spiderman: Into the Spider-Verse', 2018, 'PG', 117, 'Teen Miles Morales becomes the Spider-Man of his universe, and must join with five spider-powered individuals from other dimensions to stop a threat for all realities.', 8.4, 87, true, 9);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched, nate_score)
VALUES ('Split', 2016, 'PG-13', 117, 'Three girls are kidnapped by a man with a diagnosed 23 distinct personalities. They must try to escape before the apparent emergence of a frightful new 24th.', 7.3, 62, true, 7);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched, nate_score)
VALUES ('Star Trek', 2009, 'PG-13', 127, 'The brash James T. Kirk tries to live up to his father''s legacy with Mr. Spock keeping him in check as a vengeful Romulan from the future creates black holes to destroy the Federation one planet at a time.', 7.9, 82, true, 7);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched, nate_score)
VALUES ('Star Trek Into Darkness', 2013, 'PG-13', 132, 'After the crew of the Enterprise find an unstoppable force of terror from within their own organization, Captain Kirk leads a manhunt to a war-zone world to capture a one-man weapon of mass destruction.', 7.7, 72, true, 7);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched)
VALUES ('Star Trek Beyond', 2016, 'PG-13', 122, 'The crew of the USS Enterprise explores the furthest reaches of uncharted space, where they encounter a new ruthless enemy, who puts them, and everything the Federation stands for, to the test.', 7.0, 68, false);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched)
VALUES ('Thor: Ragnarok', 2017, 'PG-13', 130, 'Imprisoned on the planet Sakaar, Thor must race against time to return to Asgard and stop Ragnarök, the destruction of his world, at the hands of the powerful and ruthless villain Hela.', 7.9, 74, false);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched, nate_score)
VALUES ('Tomb Raider', 2018, 'PG-13', 119, 'Lara Croft (Alicia Vikander), the fiercely independent daughter of a missing adventurer, must push herself beyond her limits when she discovers the island where her father, Lord Richard Croft (Dominic West) disappeared.', 6.3, 48, true, 6);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched, nate_score)
VALUES ('Underworld', 2003, 'R', 121, 'Selene, a vampire warrior, is entrenched in a conflict between vampires and werewolves, while falling in love with Michael, a human who is sought by werewolves for unknown reasons.', 7.0, 42, true, 7);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched, nate_score)
VALUES ('Warcraft', 2016, 'PG-13', 123, 'As an Orc horde invades the planet Azeroth using a magic portal, a few human heroes and dissenting Orcs must attempt to stop the true evil behind this war.', 6.8, 32, true, 7);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched, nate_score)
VALUES ('War of the Worlds', 2005, 'PG-13', 116, 'Selene, a vampire warrior, is entrenched in a conflict between vampires and werewolves, while falling in love with Michael, a human who is sought by werewolves for unknown reasons.', 6.5, 73, true, 7);

INSERT INTO movies (title, release_year, mpaa_rating, runtime_in_min, summary, imdb_score, metacritic_score, has_nate_watched, nate_score)
VALUES ('Zero Dark Thirty', 2012, 'R', 157, 'A chronicle of the decade-long hunt for al-Qaeda terrorist leader Osama bin Laden after the September 2001 attacks, and his death at the hands of the Navy S.E.A.L.s Team 6 in May 2011.', 7.4, 95, true, 8);

COMMIT;

BEGIN TRANSACTION;

INSERT INTO directors (first_name, last_name, gender)
VALUES ('Sam', 'Mendes', 'M');

INSERT INTO directors (first_name, last_name, gender)
VALUES ('James', 'Gray', 'M');

INSERT INTO directors (first_name, last_name, gender)
VALUES ('Ridley', 'Scott', 'M');

INSERT INTO directors (first_name, last_name, gender)
VALUES ('Denis', 'Villeneuve', 'M');

INSERT INTO directors (first_name, last_name, gender)
VALUES ('Alex', 'Garland', 'M');

INSERT INTO directors (first_name, last_name, gender)
VALUES ('James', 'Wan', 'M');

INSERT INTO directors (first_name, last_name, gender)
VALUES ('Spike', 'Lee', 'M');

INSERT INTO directors (first_name, last_name, gender)
VALUES ('Martin', 'Campbell', 'M');

INSERT INTO directors (first_name, last_name, gender)
VALUES ('Marc', 'Foster', 'M');

INSERT INTO directors (first_name, last_name, gender)
VALUES ('Sam', 'Mendes', 'M');

INSERT INTO directors (first_name, last_name, gender)
VALUES ('Christoper', 'Nolan', 'M');

INSERT INTO directors (first_name, last_name, gender)
VALUES ('Tim', 'Miller', 'M');

INSERT INTO directors (first_name, last_name, gender)
VALUES ('Rob', 'Letterman', 'M');

INSERT INTO directors (first_name, last_name, gender)
VALUES ('David', 'Ayer', 'M');

INSERT INTO directors (first_name, last_name, gender)
VALUES ('David', 'Yates', 'M');

INSERT INTO directors (first_name, last_name, gender)
VALUES ('Mamoru', 'Oshii', 'M');

INSERT INTO directors (first_name, last_name, gender)
VALUES ('Gary', 'Ross', 'M');

INSERT INTO directors (first_name, last_name, gender)
VALUES ('Ron', 'Howard', 'M');

INSERT INTO directors (first_name, last_name, gender)
VALUES ('Chad', 'Stahelski', 'M');

INSERT INTO directors (first_name, last_name, gender)
VALUES ('Todd', 'Phillips', 'M');

INSERT INTO directors (first_name, last_name, gender)
VALUES ('Rian', 'Johnson', 'M');

INSERT INTO directors (first_name, last_name, gender)
VALUES ('James', 'Mangold', 'M');

INSERT INTO directors (first_name, last_name, gender)
VALUES ('Peter', 'Jackson', 'M');

INSERT INTO directors (first_name, last_name, gender)
VALUES ('Sam', 'Mendes', 'M');

INSERT INTO directors (first_name, last_name, gender)
VALUES ('Lana', 'Wachowski', 'F');

INSERT INTO directors (first_name, last_name, gender)
VALUES ('Lilly', 'Wachowski', 'F');

INSERT INTO directors (first_name, last_name, gender)
VALUES ('Christopher', 'McQuarrie', 'M');

INSERT INTO directors (first_name, last_name, gender)
VALUES ('Joseph', 'Kosinski', 'M');

INSERT INTO directors (first_name, last_name, gender)
VALUES ('Guillermo', 'del Toro', 'M');

INSERT INTO directors (first_name, last_name, gender)
VALUES ('Sam', 'Mendes', 'M');

INSERT INTO directors (first_name, last_name, gender)
VALUES ('Bong', 'Joon Ho', 'M');

INSERT INTO directors (first_name, last_name, gender)
VALUES ('Paul Thomas', 'Anderson', 'M');

INSERT INTO directors (first_name, last_name, gender)
VALUES ('Joachim', 'Ronning', 'M');

INSERT INTO directors (first_name, last_name, gender)
VALUES ('Espen', 'Sandberg', 'M');

INSERT INTO directors (first_name, last_name, gender)
VALUES ('Brad', 'Bird', 'M');

INSERT INTO directors (first_name, last_name, gender)
VALUES ('Jan', 'Pinkava', 'M');

INSERT INTO directors (first_name, last_name, gender)
VALUES ('Francis', 'Lawrence', 'M');

INSERT INTO directors (first_name, last_name, gender)
VALUES ('Steven', 'Spielberg', 'M');

INSERT INTO directors (first_name, last_name, gender)
VALUES ('Alejandro G.', 'Inarritu', 'M');

INSERT INTO directors (first_name, last_name, gender)
VALUES ('Jaume', 'Collet-Serra', 'M');

INSERT INTO directors (first_name, last_name, gender)
VALUES ('Jeff', 'Fowler', 'M');

INSERT INTO directors (first_name, last_name, gender)
VALUES ('Bob', 'Persichetti', 'M');

INSERT INTO directors (first_name, last_name, gender)
VALUES ('Peter', 'Ramsey', 'M');

INSERT INTO directors (first_name, last_name, gender)
VALUES ('Rodney', 'Rothman', 'M');

INSERT INTO directors (first_name, last_name, gender)
VALUES ('M. Night', 'Shyamalan', 'M');

INSERT INTO directors (first_name, last_name, gender)
VALUES ('J.J.', 'Abrams', 'M');

INSERT INTO directors (first_name, last_name, gender)
VALUES ('Taika', 'Waititi', 'M');

INSERT INTO directors (first_name, last_name, gender)
VALUES ('Roar', 'Uthaug', 'M');

INSERT INTO directors (first_name, last_name, gender)
VALUES ('Len', 'Wiseman', 'M');

INSERT INTO directors (first_name, last_name, gender)
VALUES ('Duncan', 'Jones', 'M');

INSERT INTO directors (first_name, last_name, gender)
VALUES ('Kathryn', 'Bigelow', 'F');

COMMIT;

BEGIN TRANSACTION;

INSERT INTO actors (first_name, last_name, gender)
VALUES 
/* 1917 */
('George', 'MacKay', 'M'),
('Richard', 'Madden', 'M'),
('Benedict', 'Cumberbatch', 'M'),
('Andrew', 'Scott', 'M'),
('Mark', 'Strong', 'M'),
('Colin', 'Firth', 'M'),
('Claire', 'Duburcq', 'F'),
('Chris', 'Walley', 'M'),
/* Ad Astra */
('Brad', 'Pitt', 'M'),
('Tommy Lee', 'Jones', 'M'),
('Ruth', 'Negga', 'F'),
('Donald', 'Sutherland', 'M'),
('Liv', 'Tyler', 'F'),
('Kimberly', 'Elise', 'F'),
('John', 'Ortiz', 'M'),
('John', 'Finn', 'M'),
/* Alien: Covenant */
('Michael', 'Fassbender', 'M'),
('Noomi', 'Rapace', 'F'),
('Katherine', 'Waterston', 'F'),
('Callie', 'Hernandez', 'F'),
('Billy', 'Crudup', 'M'),
('Guy', 'Pearce', 'M'),
('Danny', 'McBride', 'M'),
('Carmen', 'Ejogo', 'F'),
/* Arrival */
('Amy', 'Adams', 'F'),
('Jeremy', 'Renner', 'M'),
('Forest', 'Whitaker', 'M'),
('Michael', 'Stuhlbarg', 'M'),
('Tzi', 'Ma', 'M'),
('Mark', 'O Brien', 'M'),
/* Annihilation */
('Natalie', 'Portman', 'F'),
('Jennifer', 'Jason Leigh', 'F'),
('Gina', 'Rodriguez', 'F'),
('Tessa', 'Thompson', 'F'),
('Oscar', 'Isaac', 'M'),
('Tuva', 'Novotny', 'F'),
('Benedict', 'Wong', 'M'),
('Sonoya', 'Mizuno', 'F'),
('David', 'Gyasi', 'M'),
/* Aquaman */
('Jason', 'Momoa', 'M'),
('Amber', 'Heard', 'F'),
('Patrick', 'Wilson', 'M'),
('Nicole', 'Kidman', 'F'),
('Yahya', 'Abdul-Mateen II', 'M'),
('Willem', 'Dafoe', 'M'),
('Dolph', 'Lundgren', 'M'),
('Temuera', 'Morrison', 'M'),
('Randall', 'Park', 'M'),
/* BlacKkKlansman */
('John David', 'Washington', 'M'),
('Adam', 'Driver', 'M'),
('Laura', 'Harrier', 'F'),
('Topher', 'Grace', 'M'),
('David', 'Duke', 'M'),
('Jasper', 'Paakkonen', 'M'),
('Ryan', 'Eggold', 'M'),
('Alec', 'Baldwin', 'M'),
/* Blade Runner 2049 */
('Ryan', 'Gosling', 'M'),
('Harrison', 'Ford', 'M'),
('Ana', 'de Armas', 'F'),
('Jared', 'Leto', 'M'),
('Sylvia', 'Hoeks', 'F'),
('Mackenzie', 'Davis', 'F'),
('Dave', 'Bautista', 'M'),
('Robin', 'Wright', 'F'),
('Carla', 'Juri', 'M'),
/* Casino Royale */
('Daniel', 'Craig', 'M'),
('Eva', 'Green', 'F'),
('Mads', 'Mikkelsen', 'M'),
('Judi', 'Dench', 'F'),
('Caterina', 'Murino', 'F'),
('Jeffrey', 'Wright', 'M'),
('Giancarlo', 'Giannini', 'M'),
('Ivana', 'Milicevic', 'F'),
('Simon', 'Abkarian', 'M'),
('Jesper', 'Christensen', 'M'),
('Tobias', 'Menzies', 'M'),
/* Quantum of Solace */
('Olga', 'Kurylenko', 'F'),
('Gemma', 'Arterton', 'F'),
('Mathieu', 'Amalric', 'M'),
('David', 'Harbour', 'M'),
/* Skyfall */
('Javier', 'Bardem', 'M'),
('Naomie', 'Harris', 'F'),
('Berenice', 'Marlohe', 'F'),
('Ralph', 'Fiennes', 'M'),
('Ben', 'Whishaw', 'M'),
('Albert', 'Finney', 'M'),
('Helen', 'McCrory', 'F'),
('Ola', 'Rapace', 'M'),
('Rory', 'Kinnear', 'M'),
/* Spectre */
('Lea', 'Seydoux', 'F'),
('Christoph', 'Waltz', 'M'),
('Monica', 'Belllucci', 'F'),
('Stephanie', 'Sigman', 'F'),
/* Batman Begins */
('Christian', 'Bale', 'M'),
('Cillian', 'Murphy', 'M'),
('Katie', 'Holmes', 'F'),
('Michael', 'Kaine', 'M'),
('Liam', 'Neeson', 'M'),
('Gary', 'Oldman', 'M'),
('Morgan', 'Freeman', 'M'),
('Tom', 'Wilkinson', 'M'),
('Ken', 'Watanabe', 'M'),
('Rutger', 'Hauer', 'M'),
('Mark', 'Boone Junior', 'M'),
('Linus', 'Roache', 'M'),
/* The Dark Knight */
('Heath', 'Ledger', 'M'),
('Aaron', 'Eckhart', 'M'),
('Maggie', 'Gyllenhaal', 'F'),
('Monique', 'Gabriela Curnen', 'F'),
('Ron', 'Dean', 'M'),
('Chin', 'Han', 'M'),
('Nestor', 'Carbonell', 'M'),
('Eric', 'Roberts', 'M'),
/* The Dark Knight Rises */
('Tom', 'Hardy', 'M'),
('Anne', 'Hathaway', 'F'),
('Joseph', 'Gordon-Levitt', 'M'),
('Marion', 'Cotillard', 'F'),
('Matthew', 'Modine', 'M'),
('Alon', 'Aboutboul', 'M'),
('Ben', 'Mendelsohn', 'M'),
('Burn', 'Gorman', 'M'),
('Daniel', 'Sunjata', 'M'),
('Aiden', 'Gillen', 'M'),
/* Deadpool */
('Ryan', 'Reynolds', 'M'),
('Morena', 'Baccarin', 'F'),
('T.J.', 'Miller', 'M'),
('Brianna', 'Hildebrand', 'F'),
('Josh', 'Brolin', 'M'),
('Stefan', 'Kapicic', 'M'),
('Ed', 'Skrein', 'M'),
('Gina', 'Carano', 'F'),
('Karan', 'Soni', 'M'),
('Leslie', 'Uggams', 'M'),
/* Pokemon Detective Pikachu */
('Justice', 'Smith', 'M'),
('Kathryn', 'Newton', 'F'),
('Bill', 'Nighy', 'M'),
('Suki', 'Waterhouse', 'F'),
('Rita', 'Ora', 'F'),
('Chris', 'Geere', 'M'),
('Omar', 'Chaparro', 'M'),
/* Dunkirk */
('Harry', 'Styles', 'M'),
('Flonn', 'Whitehead', 'M'),
('Mark', 'Rylance', 'M'),
('Kenneth', 'Branagh', 'M'),
('Jack', 'Lowden', 'M'),
('Barry', 'Keoghan', 'M'),
('Aneurin', 'Barnard', 'M'),
('Tom', 'Glynn-Carney', 'M'),
('James', 'D''Arcy', 'M'),
/* Fury */
('Shia', 'LaBeouf', 'M'),
('Logan', 'Lerman', 'M'),
('Jon', 'Bernthal', 'M'),
('Michael', 'Pena', 'M'),
('Alicia', 'von Rittberg', 'F'),
('Scott', 'Eastwood', 'M'),
('Jason', 'Isaacs', 'M');
/* Fantastic Beasts and Where to Find Them */
COMMIT;
