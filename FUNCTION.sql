Create Database SqlFunction;
Use SqlFunction;

CREATE TABLE Student_Performance (
	Student_id INT PRIMARY KEY,
    name Varchar(50),
    course Varchar(30),
    score Int,
    attendance Int,
    mentor Varchar(50), 
    join_date Date,
    city Varchar(50)
    );
    
Insert Into Student_Performance (Student_id, name, course, score, attendance, mentor, join_date, city) Values
		(101, 'Aarav Mehta', 'Data Science', 88, 92, 'Dr. Sharma', '2023-07-01', 'Mumbai'),
        (102, 'Riya Singh', 'Data Science', 76, 85, 'Dr. Sharma', '2023-07-01', 'Delhi'),
        (103, 'Kabir Khanna', 'Python', 91, 96, 'Ms. Nair', '2023-06-20', 'Mumbai'),
        (104, 'Tanvi Patel', 'SQL', 84, 89, 'Mr. Iyar', '2023-05-30', 'Bangaluru'),
        (105, 'Ayesha Khan', 'Python', 67, 81, 'Mr. Nair', '2023-07-10', 'Hyderabad'),
        (106, 'Dev Sharma', 'SQL', 73, 78, 'Mr. Iyer', '2023-05-28', 'Pune'),
        (107, 'Arjun Verma',  'Tableau', 95, 98, 'Ms. Kapoor', '2023-06-15', 'Delhi'),
        (108, 'Meera Pillai', 'Tableau', 82, 87, 'Ms. Kapoor', '2023-06-18', 'Kochi'),
        (109, 'Nikhil Rao', 'Data Science', 79, 82, 'Dr. Sharma', '2023-07-05', 'Channai'),
        (110, 'Priya Desai', 'SQL', 92, 94, 'Ms. Iyer', '2023-05-27', 'Bengaluru'),
        (111, 'Siddharth Jain', 'Python', 85, 90, 'Ms. Nair','2023-07-02', 'Mumbai'),
        (112, 'Sneha Kulkarni', 'Tableau', 74, 83, 'Ms. Kapoor', '2023-06-10', 'Pune'),
        (113, 'Rohan Gupta', 'SQL', 89, 91, 'Ms. Iyer', '2023-05-25', 'Delhi'),
        (114, 'Ishita Joshi', 'Data Science', 93, 97, 'Dr. Sharma', '2023-06-25', 'Bengaluru'),
        (115, 'Yuvraj Rao', 'Python', 71, 84, 'Ms. Nair', '2023-07-12', 'Hyderabad');
        
/* Question 1 : Create a ranking of students based on score (highest first).        
	Answer 1 : */
Select *, 
Rank() Over(order by score Desc) AS student_rank
From student_performance;

/* Question 2 : Show each student's score and the previous student’s score (based on score order).
   Answer 2 : */
   Select name, score,
   Lag(score) over(Order by score DESC) AS previous_student_score
   From student_performance;

/*  Question 3 : Convert all student names to uppercase and extract the month name from join_date.
	Answer 3 : */
    Select upper(name) As NAME,
    month(join_date) AS Joining_month 
    From student_performance;
    
/* Question 4 : Show each student's name and the next student’s attendance (ordered by attendance).
	Answer 4 : */
 
    Select name, 
    Lead(attendance) Over( order by attendance Desc) AS next_student_attendance
    From student_performance;
    
/* Question 5 : Assign students into 4 performance groups using NTILE().
   Answer 5 : */
      
Select *, 
ntile(4) over(order by score Desc) AS student_group
From student_performance;

/* Question 6 : For each course, assign a row number based on attendance (highest first)
   Answer 6 : */
   Select *, 
   row_number() Over(partition by course order by attendance Desc) As attendance_row_num
   From student_performance;
   
   
   
/* Question 7 : Calculate the number of days each student has been enrolled (from join_date to today).
(Assume current date = '2025-01-01')
Answer 7 : */

Select *,
Datediff( '2025-01-01' , join_date) AS enrollment_days
From student_performance;

/* Question 8 : Format join_date as “Month Year” (e.g., “June 2023”).
	Answer 8 : */
    
Select *, 
date_format(join_date, '%M %Y') AS Month_Year
From student_performance;
    
/* Question 9 : Replace the city ‘Mumbai’ with ‘MUM’ for display purposes.
	Answer 8 : */
    
    Select *, 
    Replace(city, 'Mumbai', 'MUM') AS city_display
    From student_performance;
    
    
 /* Question 10 : For each course, find the highest score using FIRST_VALUE()
	Anser 10 : */ 
 
 Select Distinct course,
 First_value(score) 
 over(partition by course order by score DESC) As Highest_score 
 From student_performance; 
 
 