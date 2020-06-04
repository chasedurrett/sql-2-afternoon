select * from invoice i 
join invoice_line il 
on i.invoice_id = il.invoice_id where il.unit_price > .99

select i.total, i.invoice_date, c.first_name,
c.last_name 
from invoice i
join customer c 
on c.customer_id = i.customer_id; 

select c.first_name, c.last_name,
e.first_name, e.last_name
from customer c join
employee e on
e.employee_id = c.support_rep_id;\

select ar.name, al.title
from album al join 
artist ar on 
al.artist_id = ar.artist_id;

select plt.track_id from 
playlist_track plt join 
playlist pl on 
plt.playlist_id = pl.playlist_id 
where pl.name = 'Music';

select t.name from track t 
join playlist_track pt on
t.track_id = pt.track_id 
where pt.playlist_id = 5;

select t.name, p.name from 
track t 
join playlist_track pt on
t.track_id = pt.track_id 
join playlist p on 
pt.playlist_id = p.playlist_id;

select t.name, al.title 
from track t 
join album al on
t.album_id = al.album_id
join genre g on
t.genre_id = g.genre_id where 
g.name = 'Alternative & Punk';

select * from invoice where 
invoice_id in 
(select invoice_id from
invoice_line where 
unit_price > .99)

select * from
playlist_track where 
playlist_id in 
(select playlist_id from
playlist where 
name = 'Music')

select name from track 
where track_id 
in (select track_id from 
playlist_track where
   playlist_id = 5);

select * from track
where genre_id in
(select genre_id from genre where
name = 'Comedy');

select * from track
where album_id in
(select album_id from album where
title = 'Fireball');

select * from track
where album_id in
(select album_id from album where
 artist_id in(select artist_id from artist 
        where name = 'Queen'
       )
);

update customer
set fax = null
where fax is not null;

update customer 
set company = 'Self'
where company is null;

update customer
set last_name = 'Thompson'
where first_name = 'Julia' and last_name = 'Barnett'

update customer 
set support_rep_id = 4
where email = 'luisrojas@yahoo.cl';

update track
set composer = 'The darkness around us'
where genre_id = 
(select genre_id from genre 
 where name = 'Metal') 
and composer is null;

select count(*), g.name 
from track t
join genre g 
on t.genre_id = g.genre_id
group by g.name;

select count(*), g.name 
from track t 
join genre g on 
t.genre_id = g.genre_id
where g.name = 'Pop' or 
g.name = 'Rock'
group by g.name;

select count(*), a.name
from artist a 
join album al on 
a.artist_id = al.artist_id
group by a.name;

select distinct composer
from track;

select distinct 
billing_postal_code
from invoice;

select distinct 
company from 
customer;

delete from practice_delete 
where type = 'bronze'

delete from practice_delete 
where type = 'silver'

delete from practice_delete 
where value = 150;

create table users (
  id serial primary key,
  name varchar(50),
  email varchar(50)
)

create table products (
	id serial primary key,
  name varchar(50), 
  price integer
)

create table orders (
id serial primary key,
product_id integer references products(id),
users_id int references users(id)
);

insert into users 
(name, email)
values 
('Amanda', 'Amanda.com')
insert into users 
(name, email)
values 
('Jeff', 'Jeff.com')
insert into users 
(name, email)
values 
('Sally', 'Sally.com')

insert into products 
(name, price)
values 
('Slinky', 10)
insert into products 
(name, price)
values 
('Phone', 100)
insert into products 
(name, price)
values 
('Car', 500)

insert into orders 
(product_id, product_id, product_id)
values 
(1, 2, 3)

select * from orders o
join products p on
p.id = o.product_id
where o.product_id = 1;

select * from orders o
join products p on
p.id = o.product_id

select sum(p.price) from orders o
join products p on
p.id = o.product_id
where o.product_id = 1;

select * from orders o 
join users u on
u.id = o.users_id
join products p on 
p.id = u.id

select count(*), u.name from orders o 
join users u on
u.id = o.users_id
join products p on 
p.id = u.id
group by u.name 
