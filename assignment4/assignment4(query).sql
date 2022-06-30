SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE print_employee(
    e_id employees.employee_id%TYPE 
)
IS
  e_details employees%ROWTYPE;
BEGIN
  -- get employee based on employee id
  SELECT *
  INTO e_details
  FROM employees
  WHERE employees.employee_id = e_id;
  
  dbms_output.put_line( e_details.first_name || ' ' || e_details.last_name || '        Mobile <' || e_details.phone_number ||'>' );

EXCEPTION
   WHEN OTHERS THEN
      dbms_output.put_line( 'no employee found' );
END;
/
CREATE OR REPLACE PROCEDURE print_dependent(
    d_id dependents.dependent_id%TYPE 
)
IS
  d_details dependents%ROWTYPE;
BEGIN
  -- get employee based on employee id
  SELECT *
  INTO d_details
  FROM dependents
  WHERE dependents.dependent_id = d_id;
  
  dbms_output.put_line( d_details.first_name || ' ' || d_details.last_name );

EXCEPTION
   WHEN OTHERS THEN
      dbms_output.put_line( 'no dependents found' );
END;
/


CREATE OR REPLACE FUNCTION total_employee_greater_salary(
    slr employees.salary%TYPE
) 
RETURN NUMBER
IS
    total_employee NUMBER := 0;
BEGIN
    -- get total sales
    SELECT count(employee_id)
    INTO total_employee
    FROM employees
    WHERE salary >= slr;
    
    -- return the total employees
    RETURN total_employee;
END;
/

CREATE OR REPLACE FUNCTION total_employee_greater_salary(
    slr employees.salary%TYPE
) 
RETURN NUMBER
IS
    total_employee NUMBER := 0;
BEGIN
    -- get total sales
    SELECT count(employee_id)
    INTO total_employee
    FROM employees
    WHERE salary >= slr;
    
    -- return the total employees
    RETURN total_employee;
    

EXCEPTION
   WHEN OTHERS THEN
      RETURN 0;
END;