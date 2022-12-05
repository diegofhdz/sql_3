--Diego Hernandez

--Diego Hernandez
--Question 1
select customer_id, first_name, last_name, email,  district
from customer inner join address
on customer.address_id = address.address_id
where district = 'Texas';

--Question 2
select first_name, last_name, amount from customer full join payment
on customer.customer_id = payment.customer_id
where amount > 6.99;

--Question 3
select first_name, last_name from customer
where customer_id in (
	select customer_id
	from payment
	group by customer_id
	having sum(amount) > 175
	order by sum(amount) desc
);

--Question 4
select first_name, last_name, country from customer
full join address on customer.address_id  = address.address_id
full join city on address.city_id = city.city_id 
full join country on city.country_id = country.country_id
where country = 'Nepal';

--Question 5
select first_name, last_name from staff
where staff.staff_id in (
	select staff_id from payment 
	group by staff_id order by count(staff_id)
);

--Question 6
select rating, count(film_id) from film group by rating;

--Question 7
select * from customer where customer_id in (
	select customer_id from payment where amount > 6.99 
	group by
	customer_id
);

--Question 8
select count(distinct rental_id) from payment where amount = 0;
