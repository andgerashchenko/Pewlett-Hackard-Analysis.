SELECT e.emp_no,
e.first_name,
e.last_name,
t.title,
t.from_date,
t.to_date
-- INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON e.emp_no = t.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31');



-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
-- INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

SELECT COUNT (emp_no) as count, title
-- INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC

SELECT DISTINCT ON (e.emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
t.title
-- INTO mentorship_eligibilty
FROM employees AS e
INNER JOIN dept_emp as de
ON e.emp_no = de.emp_no
INNER JOIN titles as t
ON e.emp_no = t.emp_no
WHERE de.to_date = ('9999-01-01')
AND (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no

SELECT COUNT (u.emp_no) as count, u.title
FROM unique_titles as u
INNER JOIN employees as e
ON u.emp_no = e.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1952-12-31')
GROUP BY u.title
ORDER BY count, title

SELECT COUNT (m.emp_no) as ment_count, r.count as retiring_count, m.title
FROM mentorship_eligibilty as m
INNER JOIN retiring_titles as r
ON m.title = r.title
GROUP BY m.title, r.count
ORDER BY count, title



















