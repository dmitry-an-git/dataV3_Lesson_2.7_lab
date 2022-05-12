use sakila;

-- How many films are there for each of the categories in the category table. 
-- Use appropriate join to write this query.

select * from film_category;
select * from category;
select * from film;

select fc.category_id, c.name as cat_name, count(f.film_id) as counter from film as f
left join film_category as fc
on f.film_id = fc.film_id
left join category as c
on fc.category_id = c.category_id
group by fc.category_id
order by counter desc;

-- Which actor has appeared in the most films?

select * from actor;
select * from film_actor;

select a.actor_id, a.first_name, a.last_name, count(fa.film_id) as counter from actor as a
right join film_actor as fa
on a.actor_id = fa.actor_id
group by a.actor_id
order by counter desc
limit 1;


-- Most active customer (the customer that has rented the most number of films)

select * from customer;
select * from rental;

select c.customer_id, c.first_name, c.last_name, count(r.customer_id) as counter from customer as c
right join rental as r
on c.customer_id = r.customer_id
group by c.customer_id
order by counter desc
limit 1;

-- Display the first and last names, as well as the address, of each staff member.

select * from staff;
select * from address;
select * from city;

select s.staff_id, s.first_name, s.last_name, a.address, a.district, c.city from staff as s
join address as a
on s.address_id = a.address_id
join city as c
on a.city_id = c.city_id;


-- List each film and the number of actors who are listed for that film.

select * from film;
select * from film_actor;

select f.film_id, f.title, count(fa.actor_id) as counter from film as f
left join film_actor as fa
on f.film_id = fa.film_id
group by f.film_id
order by counter desc;

-- Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
-- List the customers alphabetically by last name.

select * from payment;
select * from customer;

select c.customer_id, c.first_name, c.last_name, sum(p.amount) as total_paid from customer as c
right join payment as p
on c.customer_id = p.customer_id
group by c.customer_id
order by last_name asc;

-- List number of films per category.

select * from film;
select * from film_category;
select * from category;

select c.name, count(f.film_id) as counter from film as f
join film_category as fc
on f.film_id = fc.film_id
join category as c
on fc.category_id = c.category_id
group by c.name
order by counter desc;

