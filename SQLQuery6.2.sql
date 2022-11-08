/*****************************************************************************************************************
NAME:    EC_IT143_W6.2_IT
PURPOSE: My script purpose...

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     11/07/2022  Ignacio Tapia      1. Built this script for EC IT440


RUNTIME: 
0.42 s

NOTES: 
This is where I talk about what this script is, why I built it, and other stuff...
 
******************************************************************************************************************/

--Q1. How many users do we have in our database?

USE AdventureWorks2019
SELECT COUNT(*)  
FROM HumanResources.Employee;  
GO  

--Q2. What are the newest employees in the data table?

  
USE AdventureWorks2019
GO

SELECT top (10) HireDate
from HumanResources.Employee

--Q3:  Can you create a table that contains sales customer details with one of these columns: 
--customer ID, Customer First Name, Customer Last Name, Customer Contact, or Customer Address?  Metadata

USE AdventureWorks2019
GO

SELECT FirstName,LastName, PhoneNumber, AddressLine1, CountryRegionName
FROM Sales.vIndividualCustomer;


-- Q4: Can you organize all of our products by ascending product number? Metadata

USE AdventureWorks2019
GO

select * 
FROM Production.Product
ORDER BY ProductID ASC;

-- Q5: The boss wants to ensure that the products we sell last as long as possible
--As such, we need to know what the 20 most frequently returned products are
--We also need to know how often those products are scrapped, 
-- and why they are scrapped in order from most popular reason, to least popular reason.

USE AdventureWorks2019
GO

Select Production.WorkOrder.ProductID, Production.Product.Name,Production.WorkOrder.ScrappedQty,ScrapReason.Name

FROM Production.WorkOrder

 LEFT JOIN Production.Product

ON Production.WorkOrder.ProductID = Production.Product.ProductID

LEFT JOIN Production.ScrapReason 

ON Production.ScrapReason.ScrapReasonID = Production.WorkOrder.ScrapReasonID
Where  ScrappedQty >= 134
order by ScrappedQty DESC;


-- Q6: We want to throw a party for all of the employees who have been with the company the longest
--We need a list that shows their first and last name, their gender, the length of time they have been with our company, 
--and their job title.They must be sorted alphabetically by job title.
-- Include first and last names, age, gender, and job title for each record.


USE AdventureWorks2019
GO

Select  Person.Person.FirstName , Person.Person.LastName, DATEDIFF (Year,HumanResources.Employee.BirthDate,GETDATE()) AS [Age (in years)],  HumanResources.Employee.Gender ,DATEDIFF (year, HumanResources.Employee.HireDate, GETDATE()) as [Hired Time (in years)]   , HumanResources.Employee.JobTitle
FROM Person.Person

INNER JOIN HumanResources.Employee
ON Person.Person.BusinessEntityID = HumanResources.Employee.BusinessEntityID
ORDER BY (Employee.JobTitle) ASC ;

-- Q7: Who are the 5 first hired employees in the company? 



USE AdventureWorks2019
GO

Select  TOP 5 Person.Person.FirstName , Person.Person.LastName, DATEDIFF (Year,HumanResources.Employee.BirthDate,GETDATE()) AS [Age (in years)], DATEDIFF (DAY, HumanResources.Employee.HireDate, GETDATE()) as [Hired Time (Days)]   , HumanResources.Employee.JobTitle
FROM Person.Person

INNER JOIN HumanResources.Employee
ON Person.Person.BusinessEntityID = HumanResources.Employee.BusinessEntityID
ORDER BY [Hired Time (Days)] DESC ;


-- Q8: Who are the ten oldest employees according to their age?
  

USE AdventureWorks2019
GO

Select TOP 10 (Person.Person.FirstName) , Person.Person.LastName, DATEDIFF (Year,HumanResources.Employee.BirthDate,GETDATE()) AS [Age]
FROM Person.Person 

INNER JOIN HumanResources.Employee
ON Person.Person.BusinessEntityID = HumanResources.Employee.BusinessEntityID

ORDER BY (Employee.JobTitle) ASC;

