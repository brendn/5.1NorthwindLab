# Select all the records from the "Customers" table. 
SELECT * FROM customers

# Get distinct countries from the Customers table. In other words, each country should only appear once in the results. (You’ll probably have to search online for this one.)
SELECT DISTINCT country_region FROM customers

# Get all the records from the table Customers where the Customer’s ID starts with “BL”.
SELECT * FROM customers WHERE id LIKE 'BL%'

# Get the first 100 records of the orders table.
SELECT * FROM orders LIMIT 100

# Get all customers that live in the postal codes 1010, 3012, 12209, and 05023.
SELECT * FROM customers WHERE zip_postal_code="1010" OR zip_postal_code="3012" OR zip_postal_code="12209" OR zip_postal_code="05023";

# Get all orders where the ShipRegion is not equal to NULL.
SELECT * FROM orders WHERE ship_country_region IS NOT NULL

# Get all customers ordered by the country, then by the city.
SELECT * FROM customers ORDER BY country_region, city;

# Add a new customer to the customers table. You can use whatever values
INSERT INTO customers (id, company, last_name, first_name, email_address, job_title, business_phone, home_phone, mobile_phone, fax_number, address, city, state_province, zip_postal_code, country_region, web_page, notes, attachments)
VALUES (99, "BrendanCorp", "Brendington", "Brendan", "brendan@brendan.gov", "king", null, null, null, null, "100 Brendan St", "BrendanVille", "BrendanLand", 12345, "BREN", "brendan.gov", "Proceed with caution", null)

# Update all ShipRegion to the value ‘EuroZone’ in the Orders table, where the ShipCountry is equal to France. (Note: this requires safe updates to be turned off. Search online for more info.)
#### My database doesn't have a ShipRegion or ShipCountry, only ship_country_region
UPDATE orders SET ship_country_region = 'EuroZone' WHERE ship_country_region = 'France'

# Delete all orders from `order details` that have quantity of 1. 
DELETE FROM orders WHERE quantity = "1"

# Calculate the average, max, and min of the quantity at the `order details` table.
SELECT AVG(quantity), MAX(quantity), MIN(quantity) FROM order_details

# Calculate the average, max, and min of the quantity at the `order details` table, grouped by the orderid. This will show the average, max, and min for each order.
SELECT AVG(quantity), MAX(quantity), MIN(quantity) FROM order_details GROUP BY order_id

# Find the CustomerID that placed order 10290 (orders table)
SELECT customer_id FROM orders WHERE id = 10290

# Do an inner join, left join, right join on orders and customers tables. (These are three separate queries, one for each type of join.)
SELECT * FROM customers INNER JOIN orders on orders.customer_id = customers.id
SELECT * FROM customers LEFT JOIN orders on orders.customer_id = customers.id
SELECT * FROM customers RIGHT JOIN orders on orders.customer_id = customers.id

# Use a join to get the ship city and ship country of all the orders which are associated with an employee who is in London.
SELECT ship_country_region, ship_city FROM orders INNER JOIN employees ON employees.id = orders.employee_id AND employees.country_region = 'London'

# Get employees’ firstname for all employees who report to no one.
#### My database didn't have this column, so I'm guessing here
SELECT first_name FROM employees WHERE reports_to = NULL

# Get employees’ firstname for all employees who report to Andrew.
#### My database didn't have this column, so I'm guessing here
SELECT first_name FROM employees WHERE reports_to = 'Andrew'
