-- Create Database
CREATE DATABASE IF NOT EXISTS foodorderingwesitedb;
USE foodorderingwesitedb;

-- Users Table
CREATE TABLE IF NOT EXISTS users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(100),
    user_address TEXT,
    user_email VARCHAR(100) UNIQUE,
    user_password VARCHAR(100),
    user_mobileno VARCHAR(20)
);

-- Admin Table
CREATE TABLE IF NOT EXISTS admin (
    admin_id INT AUTO_INCREMENT PRIMARY KEY,
    admin_name VARCHAR(100),
    admin_email VARCHAR(100) UNIQUE,
    admin_password VARCHAR(100)
);

-- Menu Table
CREATE TABLE IF NOT EXISTS menu (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    item_name VARCHAR(100),
    item_type VARCHAR(50),
    item_category VARCHAR(50),
    item_serving VARCHAR(50),
    item_calories INT,
    item_price DECIMAL(10,2),
    item_rating DECIMAL(2,1),
    item_img VARCHAR(255)
);

-- Orders Table
CREATE TABLE IF NOT EXISTS orders (
    order_id VARCHAR(100) PRIMARY KEY,
    user_id INT,
    item_id INT,
    quantity INT,
    price DECIMAL(10,2),
    datetime DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (item_id) REFERENCES menu(item_id)
);

-- Order Dispatch Table
CREATE TABLE IF NOT EXISTS order_dispatch (
    order_id VARCHAR(100),
    user_id INT,
    item_id INT,
    quantity INT,
    price DECIMAL(10,2),
    datetime DATETIME,
    PRIMARY KEY (order_id, item_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (item_id) REFERENCES menu(item_id)
);
