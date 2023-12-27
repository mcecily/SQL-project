SELECT * 
FROM dbo.orders

DELETE FROM orders
WHERE Customer_name IS NULL

SELECT COUNT(*)
FROM orders

--Calculate total sales/revenue
SELECT 
      SUM(Sales) AS total_revenue
FROM orders

--Average order value	  
  SELECT 
      SUM(Sales) /
      COUNT(DISTINCT Order_id) AS avg_order_value
FROM orders

--Total Coffee sold - sum of the quantities of all coffee sold
SELECT 
      SUM(Quantity)AS total_coffee_sold
FROM orders
	  
--Total orders placed
SELECT
      COUNT(DISTINCT Order_id) AS total_orders
FROM orders

--Average coffee sales per order

SELECT
     SUM(Quantity)/
	 COUNT(DISTINCT Order_id)
FROM orders

--Daily trend for total orders

SELECT 
      DATENAME(DW,Order_Date) AS order_day,
	  COUNT(DISTINCT Order_id) AS total_orders
FROM orders
GROUP BY DATENAME(DW,Order_Date)

--Monthly trend for total orders

SELECT 
      DATENAME(MONTH,Order_Date) AS Month,
	  COUNT(DISTINCT Order_id) AS total_orders
FROM orders
GROUP BY DATENAME(MONTH,Order_Date) 
ORDER BY total_orders DESC

--Percentage of sales by coffee category

SELECT 
      Coffee_type_name,
	  SUM(Sales) AS total_sales,
	  SUM(Sales) * 100 / (SELECT SUM(Sales) FROM orders) AS percentage_sales
FROM orders
GROUP BY Coffee_type_name

--Percentage of sales by coffee size
SELECT *
FROM orders
SELECT 
      Size,
	  SUM(Sales) AS total_sales,
	  SUM(Sales) * 100 / (SELECT SUM(Sales) FROM orders) AS percentage_sales
FROM orders
GROUP BY Size

--Best Roast_type seller by revenue, total_quantity and total_orders
SELECT 
      Roast_type,
	  SUM(Sales) AS total_sales,
	  SUM(Quantity) AS total_quantity,
	  COUNT(DISTINCT order_id) AS total_orders
FROM orders
GROUP BY Roast_type
