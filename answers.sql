question 1
-- Create a normalized version of the table (1NF)
CREATE TABLE proDetail_1NF (
  orderId INT,
  customerName VARCHAR(100),
  product VARCHAR(100),
  FOREIGN KEY (orderId) REFERENCES proDetail(orderId)
);

-- Insert normalized rows (1 product per row)
INSERT INTO proDetail_1NF (orderId, customerName, product)
VALUES
  (1, 'John Doe', 'laptop'),
  (1, 'John Doe', 'mouse'),
  (2, 'Jane Smith', 'tablet'),
  (2, 'Jane Smith', 'keyboard'),
  (2, 'Jane Smith', 'mouse'),
  (3, 'Emily Clark', 'phone');


question 2
-- 1. Create Orders table (order-level info)
CREATE TABLE Orders (
  orderId INT PRIMARY KEY,
  customerName VARCHAR(100)
);

-- 2. Create OrderDetails table (product-level info)
CREATE TABLE OrderDetails (
  orderId INT,
  product VARCHAR(100),
  quantity INT,
  PRIMARY KEY (orderId, product),
  FOREIGN KEY (orderId) REFERENCES Orders(orderId)
);

-- 3. Insert data into Orders (remove duplicates)
INSERT INTO Orders (orderId, customerName)
VALUES
  (101, "John Doe"),
  (102, "Jane Smith"),
  (103, "Emily Clark");

-- 4. Insert data into OrderDetails
INSERT INTO OrderDetails (orderId, product, quantity)
VALUES
  (101, "laptop", 2),
  (101, "mouse", 1),
  (102, "tablet", 3),
  (102, "keyboard", 1),
  (102, "mouse", 2),
  (103, "phone", 1);
