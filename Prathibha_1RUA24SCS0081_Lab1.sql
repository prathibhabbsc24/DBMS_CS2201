-- Created by DBMS TEAM
-- Date: [14 August 2024 ]
-- Description: SQL script to create a simple university course management system database, 
--              including the creation, alteration, and deletion of tables.

-- Step 1: Create a new database
CREATE DATABASE db_lab;

-- Step 2: Use the newly created database
USE db_lab;

-- Step 3: Create the Students table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,             -- Unique identifier for each student
    FirstName VARCHAR(50),                 -- First name of the student
    LastName VARCHAR(50),                  -- Last name of the student
    Email VARCHAR(100) UNIQUE,             -- Email of the student, must be unique
    DateOfBirth DATE                       -- Date of birth of the student
);

-- Step 4: Create the Courses table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,              -- Unique identifier for each course
    CourseName VARCHAR(100),               -- Name of the course
    Credits INT                            -- Number of credits for the course
);

-- Step 5: Create the Enrollments table
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,          -- Unique identifier for each enrollment
    StudentID INT,                         -- Foreign key referencing Students(StudentID)
    CourseID INT,                          -- Foreign key referencing Courses(CourseID)
    EnrollmentDate DATE,                   -- Date when the student enrolled in the course
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Step 6: Select all records from the Enrollments table
SELECT * FROM Enrollments;

-- Step 7: Select all records from the Students table
SELECT * FROM Students;

-- Step 8: Select all records from the Courses table
SELECT * FROM Courses;

-- Step 9: Alter the Students table to add a PhoneNumber column
ALTER TABLE Students
ADD PhoneNumber VARCHAR(15);               -- Add a new column for storing phone numbers
DESC Students;

-- Step 10: Alter the Courses table to modify the Credits column
ALTER TABLE Courses
MODIFY Credits DECIMAL(3, 1);              -- Modify the Credits column to allow decimal values
DESC Courses;

-- Step 11: Alter the Enrollments table to add a unique constraint
ALTER TABLE Enrollments
ADD CONSTRAINT UC_StudentCourse UNIQUE (StudentID, CourseID);  -- Ensure unique student-course combinations
DESC Enrollments;

-- Step 12: Drop the Enrollments table
DROP TABLE Enrollments;                    -- Delete the Enrollments table

-- Step 13: Drop the Courses table
DROP TABLE Courses;                        -- Delete the Courses table
