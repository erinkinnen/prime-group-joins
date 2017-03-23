--1. Get all customers and their addresses.

SELECT "first_name", "last_name", "street", "city", "state", "zip" FROM "customers"
JOIN "addresses" ON "customers"."id" = "addresses"."customer_id";

--2. Get all orders and their line items.

SELECT "orders"."id", "line_items"."product_id", "products"."description"
FROM "orders" JOIN "line_items" ON
"orders"."id" = "line_items"."order_id"
JOIN "products" ON "line_items"."product_id" = "products"."id";

--3. Which warehouses have cheetos?

SELECT "warehouse"."warehouse", "products"."description", "warehouse_product"."on_hand" FROM "warehouse" JOIN "warehouse_product"
ON "warehouse"."id" = "warehouse_product"."warehouse_id" JOIN "products"
ON "warehouse_product"."product_id" = "products"."id" WHERE "products"."description" = 'cheetos'
AND "warehouse_product"."on_hand" > 0;

--4. Which warehouses have diet pepsi?

SELECT "warehouse"."warehouse", "products"."description", "warehouse_product"."on_hand" FROM "warehouse" JOIN "warehouse_product"
ON "warehouse"."id" = "warehouse_product"."warehouse_id" JOIN "products"
ON "warehouse_product"."product_id" = "products"."id" WHERE "products"."description" = 'diet pepsi'
AND "warehouse_product"."on_hand" > 0;

--5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.

SELECT "customers"."first_name", "customers"."last_name", count("orders"."id")
FROM "customers" JOIN "addresses" ON "customers"."id" = "addresses"."customer_id"
JOIN "orders" ON "addresses"."id" = "orders"."address_id"
GROUP BY "customers"."first_name", "customers"."last_name";

--6. How many customers do we have?

SELECT COUNT("customers"."id") FROM "customers";

--7. How many products do we carry?

SELECT COUNT("id") FROM "products";

--What is the total available on-hand quantity of diet pepsi?

SELECT "products"."description", SUM("warehouse_product"."on_hand")
FROM "products" JOIN "warehouse_product"
ON "products"."id" = "warehouse_product"."product_id"
WHERE "products"."description" = 'diet pepsi'GROUP BY "products"."description"; 
