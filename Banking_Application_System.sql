show databases;
create database BankingApp;
use BankingApp;
-- Creating bank table--------------
CREATE TABLE Bank (
    BankID int primary key,
    BankName varchar(30),
    Location varchar(20)
);
desc Bank;

-- Inserting values into the Bank table----------------
INSERT INTO Bank VALUES
(1, 'SBI', 'India'),
(2, 'KBS', 'India'),
(3, 'ICICI', 'India'),
(4, 'HDFC', 'India');

SELECT * FROM Bank;

-- Branches table------------
CREATE TABLE Branches (
    BranchID int primary key,
    BankID int,
    BranchName varchar(45) NOT NULL,
    ManagerName varchar(30),
    FOREIGN KEY (BankID) REFERENCES Bank(BankID)
);

-- Inserting values into the Branches table------
INSERT INTO Branches VALUES
(11, 1, 'Hafeezpet', 'Suresh'),
(22, 2, 'Kondapur', 'Madhavi'),
(33, 3, 'Hyderabad', 'Chandramohan'),
(44, 4, 'Kerala', 'Vivek');

SELECT * FROM Branches;

-- Employee table------------
CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(30),
    branchid INT,
    salary DECIMAL(10, 2),
    FOREIGN KEY (branchid) REFERENCES Branches(branchid)
);

-- Inserting values into the Employee table-------------
INSERT INTO Employee VALUES
(1, 'Mahender', 11, 75000.00),
(2, 'Gopal', 22, 45000.00),
(3, 'Geetha', 33,40000.00),
(4, 'Latha',44, 35000.00);


-- Account_Holder table----------------------
CREATE TABLE Account_Holder (
    Acc_HolID int primary key,
    Acc_HolName varchar(30),
    Address varchar(50),
    PhoneNum bigint
);

-- Inserting values into the Account_Holder table------
INSERT INTO Account_Holder VALUES
(101, 'Devika', 'Hyderabad', 9543281347),
(102, 'Vandy', 'Karimnagar', 9444281348),
(103, 'Thanuja', 'Hyderabad', 949655348),
(104, 'Anusha', 'Siricilla', 9525881346);

-- Account table---------
CREATE TABLE AccountInfo (
    AccountID int primary key,
    AccountType varchar(50),
    BranchID int,
    Acc_HolID int,
    Balance int,
    FOREIGN KEY (BranchID) REFERENCES Branches(BranchID),
    FOREIGN KEY (Acc_HolID) REFERENCES Account_Holder(Acc_HolID)
);

-- Inserting values into the AccountInfo table-----------
INSERT INTO AccountInfo  VALUES
(1, 'Savings', 11, 101, 90000),
(2, 'Current', 22, 102, 85000),
(3, 'Savings', 33, 103, 75200),
(4, 'Savings', 44, 104, 82000);

-- Transactions table---------------------
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    TransactionType VARCHAR(15),
    AccountID INT,
    Amount INT,
    FOREIGN KEY (AccountID) REFERENCES AccountInfo(AccountID)
);

-- Inserting values into the Transactions table---------------
INSERT INTO Transactions VALUES
(111, 'Deposit', 1, 35000),
(112, 'Withdraw', 2, 30000),
(113, 'Deposit', 3, 4000),
(114, 'Withdraw', 4, 5000);

SELECT * FROM Transactions;

-- Loan table----------------------------
CREATE TABLE Loan (
    LoanID int primary key ,
    LoanType varchar(30),
    Acc_HolID int,
    employee_id int,
    Amount int,
    FOREIGN KEY (Acc_HolID) REFERENCES Account_Holder(Acc_HolID),
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);

-- Inserting values into the Loan table-----------
INSERT INTO Loan  VALUES
(12, 'PersonalLoan', 101,1, 100000),
(13, 'HomeLoan', 102, 2,25000),
(14, 'GoldLoan', 103,3, 36000),
(15, 'HomeLoan', 104, 4, 7000);

select * from Loan;

