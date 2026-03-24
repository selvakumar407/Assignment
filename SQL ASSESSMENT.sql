create database company_db;
use company_db;
create table skill(skill_id int primary key, skill_name varchar(100) not null,category varchar(100));
create table employee(emp_id int primary key, emp_name varchar(100) not null, email varchar(200), hire_date date, salary float,dept_id int , gender varchar(6));
show databases;

show tables from company_db;

rename table employee to staff;

select*from staff;

select *from employee;

alter table employee modify emp_id int auto_increment;

drop table employee;

insert into employee values ("Alice ","alice.green@gmail.com","2024-01-10",62000.00,4,"Female");

insert into employee(emp_id,emp_name,email) values("tom","tom@company.com");

select emp_id,emp_name,email from employee;

SELECT * 
FROM employee
WHERE hire_date > '2023-01-01';
CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    budget DECIMAL(10,2),
    start_date DATE,
    end_date DATE
);

INSERT INTO projects (project_id, project_name, budget, start_date, end_date)
VALUES 
(1, 'AI System', 50000.00, '2024-01-10', '2024-06-10'),
(2, 'Web Portal', 35000.00, '2024-02-01', '2024-05-01'),
(3, 'Mobile App', 60000.00, '2024-03-15', '2024-09-15'),
(4, 'Cloud Migration', 45000.00, '2024-04-01', '2024-10-01'),
(5, 'E-Commerce Platform', 70000.00, '2024-05-10', '2024-12-15');

SELECT *
FROM projects
WHERE budget > 40000.00
ORDER BY budget DESC;

CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

INSERT INTO department (dept_id, dept_name, location) VALUES
(1, 'HR', 'Chennai'),
(2, 'IT', 'Bangalore'),
(3, 'Finance', 'Chennai'),
(4, 'Marketing', 'Delhi'),
(5, 'Admin', 'Mumbai');

SELECT DISTINCT location
FROM department;

ALTER TABLE employee
ADD phone_number VARCHAR(15)
AFTER email;

UPDATE employee
SET salary = 65000.00
where emp_name = "Alice ";

ALTER TABLE employee
DROP COLUMN phone_number;

SELECT *
FROM employee
WHERE salary BETWEEN 60000 AND 80000;

SELECT *
FROM employee
WHERE emp_name LIKE 'J%';

SELECT *
FROM projects
WHERE dept_id IN (1, 2);

SELECT *
FROM employee
WHERE email IS NOT NULL;

SELECT *
FROM department
WHERE location NOT IN ('New York', 'Chicago');

SELECT *
FROM employee
WHERE YEAR(hire_date) = 2023;

SELECT *
FROM employee
WHERE hire_date BETWEEN '2023-01-01' AND '2023-12-31';

SELECT SUM(salary) AS total_salary
FROM employee;

SELECT AVG(budget) AS average_budget
FROM projects;

SELECT MAX(salary) AS highest_salary
FROM employee;

SELECT COUNT(*) AS total_employees
FROM employee
WHERE dept_id = 2;

SELECT MIN(budget) AS minimum_budget
FROM projects;

SELECT e.emp_id, e.first_name, d.dept_name
FROM employee e
INNER JOIN department d
ON e.dept_id = d.dept_id;

SELECT d.dept_name, COUNT(e.emp_id) AS employee_count
FROM department d
LEFT JOIN employee e
ON d.dept_id = e.dept_id
GROUP BY d.dept_name;

SELECT p.project_name, d.dept_name
FROM projects p
INNER JOIN department d
ON p.dept_id = d.dept_id;

SELECT e.first_name, d.dept_name
FROM employee e
INNER JOIN department d
ON e.dept_id = d.dept_id
WHERE d.location = 'San Francisco';

SELECT d.dept_name
FROM department d
LEFT JOIN projects p
ON d.dept_id = p.dept_id
WHERE p.project_id IS NULL;

SELECT CONCAT(first_name, ' ', last_name) AS Full_Name
FROM employee;

SELECT UPPER(dept_name) AS dept_name_upper
FROM department;

SELECT SUBSTRING(email, 1, 3) AS email_prefix
FROM employee;

SELECT ABS(-50000) AS absolute_value;

SELECT ROUND(AVG(salary), 2) AS average_salary
FROM employee;

SELECT *
FROM employee
ORDER BY hire_date DESC
LIMIT 3;

SELECT *
FROM employee
ORDER BY emp_id
LIMIT 3 OFFSET 3;

SELECT first_name, salary,
IF(salary >= 70000, 'High', 'Low') AS salary_category
FROM employee;

SELECT project_name, budget,
CASE
    WHEN budget >= 60000 THEN 'Large'
    WHEN budget >= 40000 THEN 'Medium'
    ELSE 'Small'
END AS budget_category
FROM projects;

SELECT dept_id, SUM(budget) AS total_budget
FROM projects
GROUP BY dept_id;

SELECT first_name
FROM employee
ORDER BY LENGTH(first_name) DESC
LIMIT 1;

SELECT *
FROM employee
WHERE hire_date >= DATE_SUB('2025-03-22', INTERVAL 90 DAY);

DELETE FROM employee
WHERE salary < 60000;

DROP TABLE projects;

SHOW TABLES;

SHOW TABLE STATUS;


DROP DATABASE database_name;