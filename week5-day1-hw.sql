-- SQL HOMEWORK QUESTIONS 1 - 10


-- 1. How many actors are there with the last name ‘Wahlberg’?

SELECT COUNT(*) 
FROM actor 
WHERE last_name = 'Wahlberg'

-- ANSWER: 2


--2. How many payments were made between $3.99 and $5.99?

SELECT COUNT(*) 
FROM payment  
WHERE amount BETWEEN 3.99 AND 5.99 

-- ANSWER: 5,607


-- 3. What film does the store have the most of? (search in inventory)

SELECT film_id, COUNT(film_id)
FROM inventory  
GROUP BY film_id 
ORDER BY count DESC;
 

-- ANSWER: There are 72 films with a quantity of 8. 


-- 4. How many customers have the last name ‘William’?

SELECT COUNT(*)
FROM customer 
WHERE last_name = 'William'

-- ANSWER: 0


-- 5. What store employee (get the id) sold the most rentals?

SELECT staff_id, COUNT(*)
FROM rental  
GROUP BY staff_id  
ORDER BY count DESC;

-- ANSWER: staff_id 1: Mike Hillyer with 8,040 rentals


-- 6. How many different district names are there?

SELECT count(DISTINCT district)
FROM address;

-- ANSWER: 378


-- 7. What film has the most actors in it? (use film_actor table and get film_id)


SELECT film_id, COUNT(actor_id)
FROM film_actor 
GROUP BY film_id
ORDER BY count DESC;

-- ANSWER: Film #508: Lambs Cincinatti with 15 actors


-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)

SELECT COUNT(*)
FROM customer  
WHERE store_id = 1 AND last_name LIKE '%es';

-- ANSWER: 13

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers 
--    with ids between 380 and 430? (use group by and having > 250)

-- HAVING
-- filter out items after agregation happens

SELECT amount, COUNT(amount)
FROM payment 
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount   
HAVING COUNT(rental_id) > 250
ORDER BY amount DESC;

-- ANSWER: 3 => 4.99 with 281 rentals, 2.99 with 290 rentals, and 0.99 with 269 rentals.


-- 10. Within the film table, how many rating categories are there? And what rating has the most
--     movies total?

SELECT count(DISTINCT rating)
FROM film;

-- PART 1: 5 Rating categories

SELECT rating, COUNT(rating)
FROM film
GROUP BY rating 
ORDER BY count DESC;

-- PART 2: PG-13 with 223 movies.






