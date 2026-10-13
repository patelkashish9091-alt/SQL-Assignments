create database MarketCoDB ;

use MarketCoDB ;

create table Company(
	CompanyID int primary key auto_increment,
	CompanyName varchar(100)
) ;

insert into Company(CompanyName) values
('Urban Outfitters, Inc.'),
('Toll Brothers'),
('Apple Inc.'),
('Google LLC'),
('Amazon'),
('Microsoft'),
('Infosys'),
('TCS'),
('Accenture'),
('Wipro') ;

select * from Company ;

-- 1.  Statement to create the Contact table.

create table Contact(
	ContactID int primary key auto_increment,
	FirstName varchar(50),
	LastName varchar(50),
	CompanyID int,
	Phone varchar(20),
	Email varchar(100),
	Foreign Key (CompanyID) References Company(CompanyID)
) ;

insert into Contact(FirstName,LastName,CompanyID,Phone,Email) values
('Dianne', 'Connor', 2, '215-555-1111', 'dianne@toll.com'),
('John', 'Smith', 1, '215-555-2222', 'john@urban.com'),
('Amit', 'Shah', 7, '999-888-7777', 'amit@infosys.com'),
('Sara', 'Lee', 4, '333-444-5555', 'sara@google.com'),
('Ravi', 'Patel', 8, '888-777-6666', 'ravi@tcs.com'),
('Neha', 'Mehta', 6, '777-666-5555', 'neha@microsoft.com'),
('Kunal', 'Verma', 9, '666-555-4444', 'kunal@accenture.com'),
('Pooja', 'Iyer', 10, '555-444-3333', 'pooja@wipro.com'),
('David', 'Brown', 5, '444-333-2222', 'david@amazon.com'),
('Emily', 'Clark', 3, '222-333-4444', 'emily@apple.com') ;

select * from Contact ;

-- 2.  Statement to create the Employee table.

create table Employee(
	EmployeeID int primary key auto_increment,
	FirstName varchar(50),
	LastName varchar(50),
	Phone varchar(20),
	Email varchar(100)
) ;

insert into Employee(FirstName,LastName,Phone,Email) values
('Lesley', 'Bland', '215-555-1234', 'lesley@marketco.com'),
('Jack', 'Lee', '215-555-2345', 'jack@marketco.com'),
('Anna', 'White', '215-555-3456', 'anna@marketco.com'),
('Mark', 'Taylor', '215-555-4567', 'mark@marketco.com'),
('Sophia', 'King', '215-555-5678', 'sophia@marketco.com'),
('Ryan', 'Scott', '215-555-6789', 'ryan@marketco.com'),
('Nina', 'Patel', '215-555-7890', 'nina@marketco.com'),
('Kevin', 'Moore', '215-555-8901', 'kevin@marketco.com'),
('Laura', 'Hill', '215-555-9012', 'laura@marketco.com'),
('Daniel', 'Green', '215-555-0123', 'daniel@marketco.com') ;

select * from Employee ;

-- 3.  Statement to create the ContactEmployee table.

create table ContactEmployee(
	ContactEmployeeID int primary key auto_increment,
	ContactID int,
	EmployeeID int,
	ContactDate date,
	Notes varchar(100),
	Foreign Key (ContactID) References Contact(ContactID),
	Foreign Key(EmployeeID) References Employee(EmployeeID)
) ;

insert into ContactEmployee(ContactID,EmployeeID,ContactDate,Notes) values
(1, 2, '2024-01-10', 'Project discussion'),
(2, 1, '2024-01-12', 'Sales call'),
(3, 4, '2024-01-15', 'Follow-up meeting'),
(4, 3, '2024-01-18', 'Demo'),
(5, 5, '2024-01-20', 'Support call'),
(6, 6, '2024-01-22', 'Contract review'),
(7, 7, '2024-01-25', 'Negotiation'),
(8, 8, '2024-01-27', 'Proposal sent'),
(9, 9, '2024-01-29', 'Introductory call'),
(10, 10, '2024-01-30', 'Feedback meeting') ;

select * from ContactEmployee ;

-- 4.  In the Employee table, the statement that changes Lesley Bland's phine number to 215-555-8800.

update Employee
set Phone = '215-555-8800'
where FirstName = 'Lesley' and LastName = 'Bland' ;

-- 5.  In the Company table, the statement that changes the name of "Urban Outfitters, Inc." to "Urban Outfitters".

update Company
set CompanyName = 'Urban Outfitters'
where CompanyName = 'Urban Outfitters, Inc.' ;

-- 6.  In ContactEmployee table, the statement that removes Dianne Connor's contact event with Jack Lee 
-- (one statement).

delete from ContactEmployee where ContactEmployeeID = 1 ;

-- 7.  Write the SQL SELECT query that displays the names of the employees that 
-- have contacted Toll Brothers (one statement). Run the SQL SELECT query in 
-- MySQL Workbench. Copy the results below as well.

select distinct e.FirstName, e.LastName from Employee e
Join ContactEmployee ce on e.EmployeeID = ce.EmployeeID
Join Contact c on ce.ContactID = c.ContactID
Join Company co on c.CompanyID = co.CompanyID
where co.CompanyName = 'Toll Brothers' ;

-- 8.  What us the significance of "%" and "_" operators in the LIKE statement?

-- 1. % --->  Matches any numner of characters

select * from Company where CompanyName like 'A%' ;

-- 2. _ --->  Matches exactly one character

select * from Employee where FirstName like 'J_hn' ;

-- 9.  Explain normalization in the context of Databases.

-- Normalization is the process of organizing data to:
-- 1.  Reduce Redundancy
-- 2.  Improve Data Integrity
-- 3.  Avoid Update anomalies

-- Examples:
-- 1.  1st Normal Form  ---> Atomic values
-- 2.  2nd Normal Form  ---> No partial dependencies
-- 3.  3rd Normal Form  ---> No transitive dependencies
-- 4.  4th Normal Form  ---> Removes multivalued dependencies

-- 10.  What does a Join in MySQL mean ?

-- A join combines rows from two or more tables based on a related columns.

-- 11.  What do you understand about DDL, DML, DCL in MySQL.

-- 1. DDL --->  Data Definition Language
		-- 1. Create ---> Create the tables/Database
		-- 2. Alter  ---> Modify the existing tables
		-- 3. Drop  --->  Drop table/Database
		-- 4. Truncate ---> Removes a field from the tables

-- 2. DML  --->  Data Manipulation Language
		-- 1. Insert ---> Add new record in table
		-- 2. Update ---> Modify the column in existing table
		-- 3. Delete ---> Delete the records from the table

-- 3 .  DCL  --->  Data Control Language
		-- 1. Grant ---> Used to give a specific permissions
		-- 2. Revoke ---> Removes previously granted permissions

-- 12.  What is the role of the MySQL Join clause in a query, and what are some common types of joins.

-- To retrieve meaningful data from multiple related tables.

-- Common types of Joins
	-- 1. Inner Join ---> Matching rows only.
	-- 2. Left Join ---> All left table data and matching the common data from right table data.
	-- 3. Right Join ---> All right table data and matching the common data from left data.
	-- 4. Full Join ---> All rows from both tables.
	-- 5. Self Join ---> A join	where a table is joined with itself to compare rows within the same table.
	-- 6.  Cross Join ---> A join that returns the Cartesian Product, combining every row of one table with every
							-- row of another table.