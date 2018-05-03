#1a. Display the first and last names of all actors from the table `actor`. 
USE sakila;
SELECT first_name, last_name
FROM actor

# 1b. Display the first and last name of each actor in a single column in upper case letters. Name the column `Actor Name`. 
USE sakila;
SELECT concat(first_name, ' ',  last_name) as 'Actor Name'
FROM actor;

 #2a. You need to find the ID number, first name, and last name of an actor, of whom you know only the first name, "Joe." What is one query would you use to obtain this information?
 SELECT actor_id, first_name, last_name
 FROM actor
 WHERE first_name = 'Joe'
 
 
#* 2b. Find all actors whose last name contain the letters `GEN`:
SELECT actor_id, first_name, last_name
FROM actor
WHERE last_name LIKE '%GEN%'
 
#* 2c. Find all actors whose last names contain the letters `LI`. This time, order the rows by last name and first name, in that order:
SELECT concat(last_name, ' ', first_name) as 'Actor Names'
FROM actor
WHERE last_name LIKE '%LI%'

# 2d. Using `IN`, display the `country_id` and `country` columns of the following countries: Afghanistan, Bangladesh, and China:
SELECT country_id, country
FROM country
WHERE country IN ('Afghanistan', 'Bangladesh', 'China');

#a. Add a `middle_name` column to the table `actor`. Position it between `first_name` and `last_name`. Hint: you will need to specify the data type.
ALTER TABLE actor
ADD COLUMN middle_name CHARACTER(255)
AFTER first_name;

#3b. You realize that some of these actors have tremendously long last names. Change the data type of the `middle_name` column to `blobs`.
ALTER TABLE actor 
MODIFY middle_name blob;

#* 3c. Now delete the `middle_name` column.
ALTER TABLE actor
DROP COLUMN middle_name;

#4a. List the last names of actors, as well as how many actors have that last name.

SELECT last_name,
COUNT(last_name) AS `num`
FROM
  actor
GROUP BY
  last_name;
  
#4b. List last names of actors and the number of actors who have that last name, but only for names that are shared by at least two actors#use the damn star later
SELECT last_name, COUNT(last_name)
FROM actor
GROUP BY last_name
HAVING COUNT(last_name) > 1;

#4c. Oh, no! The actor `HARPO WILLIAMS` was accidentally entered in the `actor` table as `GROUCHO WILLIAMS`, the name of Harpo's second cousin's husband's yoga teacher. Write a query to fix the record.  
UPDATE actor
SET first_name = 'GROUCHO' WHERE first_name = 'HARPO';

UPDATE actor
SET first_name =   
    ( CASE  
         WHEN first_name = 'GROUCHO' THEN first_name = 'HARPO'
         ELSE (first_name = 'MUCHO GROUCHO')  
       END  
    )  





