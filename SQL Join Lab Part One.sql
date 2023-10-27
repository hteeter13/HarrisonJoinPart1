-- Part One
USE sakila;
-- 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT category.name, COUNT(DISTINCT film_category.film_id) AS film_quantity
FROM film_category
JOIN category
USING (category_id)
GROUP BY film_category.category_id
ORDER by film_quantity DESC;
-- Sports highest at 74; Musical lowest at 51

-- 2. Display the total amount rung up by each staff member in August of 2005.
SELECT staff.staff_id, SUM(payment.amount)
FROM payment
JOIN staff
USING (staff_id)
WHERE payment.payment_date LIKE '2005-08%'
GROUP BY payment.staff_id;
-- #1 Total: 11853.65
-- #2 Total: 12216.49

-- 3. Which actor has appeared in the most films?
SELECT *, COUNT(actor_id) AS roles FROM actor
JOIN film_actor
USING (actor_id)
JOIN film
USING (film_id)
GROUP BY actor_id
ORDER BY roles DESC;
-- Gina Degeneres

SELECT 
-- 4. Most active customer (the customer that has rented the most number of films)
SELECT * FROM customer;
SELECT * FROM rental;
SELECT * FROM payment;

SELECT *, COUNT(payment_id) AS rental_times FROM payment
JOIN customer
USING (customer_id)
GROUP BY customer_id
ORDER BY rental_times DESC;
-- Eleanor Hunt

-- 5. Display the first and last names, as well as the address, of each staff member.
SELECT first_name, last_name, address
FROM staff
JOIN address
USING (address_id);
-- Mike	Hillyer	23 Workhaven Lane
-- Jon Stephens	1411 Lillydale Drive

-- 6. List each film and the number of actors who are listed for that film.
SELECT * FROM film;
SELECT * FROM film_actor;
SELECT * FROM actor;

SELECT *, COUNT(actor_id) AS num_actors 
FROM film
JOIN film_actor
USING (film_id)
GROUP BY title
ORDER BY num_actors DESC;
-- Lambs Cincinatti highest at 15; Many tied at 1

-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT * FROM payment;
SELECT * FROM customer;

SELECT *, SUM(amount) AS total_payment FROM payment
JOIN customer
USING (customer_id)
GROUP BY customer_id
ORDER BY last_name ASC;

-- 8. List the titles of films per category.
SELECT * FROM film;
SELECT * FROM film_category;
SELECT * FROM category;

SELECT * FROM film
RIGHT JOIN film_category
USING (film_id)
RIGHT JOIN category
USING (category_id)
GROUP BY title
ORDER BY name ASC;
-- Aphabetically ordered