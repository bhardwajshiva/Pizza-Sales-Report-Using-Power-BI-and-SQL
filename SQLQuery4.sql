
USE [Pizza DB];
select * from pizza_sales;

-- 1. Total Revenue->
SELECT SUM(total_price) as "Total_Revenue" from pizza_sales;

-- 2. Average Order Value
SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value
FROM pizza_sales;


-- 3. Total Pizzas Sold
SELECT SUM(quantity) AS Total_pizza_sold FROM pizza_sales;

-- 4. Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales;

-- 5. Average Pizzas Per Orders-->

SELECT CAST(CAST (SUM(quantity) AS DECIMAL(10,2)) /
CAST(COUNT(DISTINCT order_id)  AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_sales;


-- B. Daily Trend for Total Orders

select * from pizza_sales;

select DATENAME(WEEKDAY,order_date) AS order_day,COUNT(DISTINCT order_id) AS Total_Orders from pizza_sales 
group by DATENAME(WEEKDAY,order_date);

select * from pizza_sales;

-- Monthly Trend for Orders

select DATENAME(MONTH, order_date) as Month_Name, COUNT(DISTINCT order_id)
as Total_Orders
from pizza_sales
GROUP BY DATENAME(MONTH, order_date);

-- % of Sales by Pizza Category

SELECT * from pizza_sales;

select pizza_category,CAST(SUM(total_price)AS DECIMAL(10,2)) as "total_revenue"
,CAST(sum(total_price)/sum(sum(total_price)) OVER()*100 AS DECIMAL(10,2))as "PCT"
from pizza_sales group by pizza_category order by total_revenue desc;

--. % of Sales by Pizza Size
select pizza_size,CAST(SUM(total_price)AS DECIMAL(10,2)) as "total_revenue"
,CAST(sum(total_price)/sum(sum(total_price)) OVER()*100 AS DECIMAL(10,2))as "PCT"
from pizza_sales group by pizza_size order by total_revenue desc;


-- Total Pizzas Sold by Pizza Category
select pizza_category,count(quantity) as "TOTAL" from pizza_sales
group by pizza_category order by TOTAL desc;

SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC


--. Top 5 Pizzas by Revenue
SELECT * FROM pizza_sales;
SELECT Top 5 pizza_name,sum(total_price) as "Total_Revenve"
from pizza_sales group by pizza_name order by Total_Revenve desc ;

--. Bottom 5 Pizzas by Revenue
SELECT Top 5 pizza_name,sum(total_price) as "Total_Revenve"
from pizza_sales group by pizza_name order by Total_Revenve asc ;

---. Top 5 Pizzas by Quantity
SELECT Top 5 pizza_name,sum(quantity) as "Total_Pizza_Sold"
from pizza_sales group by pizza_name order by Total_Pizza_Sold desc ;


-- Bottom 5 Pizzas by Quantity
SELECT Top 5 pizza_name,sum(quantity) as "Total_Pizza_Sold"
from pizza_sales group by pizza_name order by Total_Pizza_Sold asc ;

-- Top 5 Pizzas by Total Orders
SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC;

select * from pizza_sales;

--. Bottom 5 Pizzas by Total Orders
SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC;











