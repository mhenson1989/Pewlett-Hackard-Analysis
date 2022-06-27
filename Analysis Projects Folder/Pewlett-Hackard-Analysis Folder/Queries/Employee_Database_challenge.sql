-- 1. Retrieve columns from employees table
SELECT emp_no,
first_name,
last_name
FROM employees

-- 2. Retrieve columns from titles table
SELECT title,
from_date,
to_date
FROM title


-- STEPS 3-7
SELECT employees.emp_no, 
	employees.first_name, 
	employees.last_name,
	title.title,
	title.from_date,
	title.to_date
INTO retirement_title
FROM employees
INNER JOIN title 
ON employees.emp_no = title.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC;

 -- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title

--Unique title
INTO unique_title
FROM retirement_title as rt
WHERE (rt.to_date = '9999-01-01')
ORDER BY rt.emp_no, rt.to_date DESC;

--Count
SELECT COUNT(ut.emp_no), ut.title
INTO retiring_titles
FROM unique_title as ut
GROUP BY title
ORDER BY COUNT(title) DESC;

--Deliverable 2
-- Step 1
SELECT emp_no, first_name, last_name, birth_date
FROM employees

--Step 2
SELECT from_date, to_date
FROM dept_emp

-- Step 3
SELECT title
FROM title

-- Step 4
SELECT DISTINCT ON (e.emp_no)e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_table
FROM employees as e
	INNER JOIN dept_emp AS de
		ON (e.emp_no = de.emp_no)
			INNER JOIN title AS t
				ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY emp_no;
