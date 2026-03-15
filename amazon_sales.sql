create database disha
use disha
select * from orders
select * from product
select o.order_id , o.order_date , o.product_id , p.product_category , p.price , o.quantity_sold , o.discount_percent , o.customer_region , o.payment_method , p.rating , p.review_count ,( p.price*o.discount_percent/100)*o.quantity_sold as total_revenue into amazon_sales_dataset from product as p join orders as o on p.product_id = o.product_id
select * from amazon_sales_dataset
select * from amazon_sales_dataset where product_id is null
select order_id , count(*) as total_orders from amazon_sales_dataset group by order_id having count(*) > 1
select sum(total_revenue) as total_sales from amazon_sales_dataset
select sum(quantity_sold) as total_quantity_sold from amazon_sales_dataset
select count(order_id) as total_orders from amazon_sales_dataset
select payment_method , sum(order_id)  as distribution from amazon_sales_dataset group by payment_method 
select customer_region , avg(total_revenue) as avg_sales from amazon_sales_dataset group by customer_region 
select product_category , sum(quantity_sold) as quantity_sold from amazon_sales_dataset group by product_category order by quantity_sold desc
