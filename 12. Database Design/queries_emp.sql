

SELECT gender, COUNT(*)
FROM employees.employees
WHERE first_name = "Parto" AND hire_date 
GROUP BY gender


SELECT *
FROM employees.employees a, employees.salaries b
WHERE a.emp_no = b.emp_no and a.first_name = "Parto" AND a.hire_date  > 2000-01-01


SELECT *
FROM employees.employees a, employees.salaries b
WHERE a.emp_no = b.emp_no AND b.salary >
(SELECT emp_no
FROM employees.salaries
WHERE (to_date - from_date) > 3)


SELECT *
FROM employees.salaries
#GROUP BY emp_no

SELECT *
FROM employees.salaries
WHERE from_date > STR_TO_DATE('2000-01-01 00:00:00', '%Y-%m-%d %H:%i:%s');


SELECT (b.to_date - b.from_date)
FROM employees.employees a, employees.salaries b
WHERE a.emp_no = b.emp_no AND (b.to_date - b.from_date) > 10


SELECT MAX(salary)
FROM employees.salaries
WHERE emp_no = 10001


SELECT *
FROM employees.employees a, employees.salaries b
WHERE a.emp_no = b.emp_no AND b.salary >
(SELECT MAX(salary)
FROM employees.salaries
WHERE emp_no = 10001)


EXPLAIN SELECT *
FROM employees.employees a, employees.salaries b, employees.titles c
WHERE a.emp_no = b.emp_no = c.emp_no AND b.salary >
(SELECT MAX(salary)
FROM employees.salaries
WHERE emp_no = 10001)

EXPLAIN select * FROM titles


EXPLAIN SELECT *
FROM employees.employees a, employees.salaries b, employees.titles c
WHERE a.emp_no = b.emp_no AND b.emp_no = c.emp_no 
