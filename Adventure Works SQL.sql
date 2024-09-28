-- kpi 1
use adventure;
select * from factinternetsales
union all select * from factinternetsales;
-- kpi 2
SELECT f.*, p.Englishproductname
FROM factinternetsales f
JOIN dimProduct p ON f.productkey = p.productkey;
-- kpi 3

SELECT CONCAT(FirstName, ' ' ,MiddleName, ' ' ,LastName) AS fullname
FROM dimcustomer;

SELECT f.* , UnitPrice
FROM factinternetsales f
JOIN dimcustomer c ON f.customerkey = f.Customerkey
JOIN dimProduct p ON p.Productkey = p.Productkey;
-- kpi 4
SELECT OrderDateKey, -- Original OrderDateKey field
    DATE_FORMAT(STR_TO_DATE(OrderDateKey, '%Y%m%d'), '%Y-%m-%d') AS Datefield -- Create a date field from OrderDateKey
FROM factinternetsales;


SELECT 
    OrderDateKey,
    YEAR(STR_TO_DATE(OrderDateKey, '%Y%m%d')) AS Year, 
    MONTH(STR_TO_DATE(OrderDateKey, '%Y%m%d')) AS Month, 
    monthname(STR_TO_DATE(OrderDateKey, '%Y%m%d')) AS monthfullname, 
    quarter(STR_TO_DATE(OrderDateKey, '%Y%m%d')) AS Quarter 
FROM factinternetsales;

SELECT 
    OrderDateKey,
    DAYNAME(OrderDateKey) AS WeekdayName,
    weekday(OrderDateKey) AS weekdayno
      FROM factinternetsales;

SELECT 
    OrderDateKey,
    YEAR(STR_TO_DATE(OrderDateKey, '%Y%m%d')) AS OrderYear, -- Extract year from OrderDateKey
    CASE
        WHEN MONTH(STR_TO_DATE(OrderDateKey, '%Y%m%d')) >= 4 THEN YEAR(STR_TO_DATE(OrderDateKey, '%Y%m%d'))
        ELSE YEAR(STR_TO_DATE(OrderDateKey, '%Y%m%d')) - 1
    END AS FinancialYear
FROM factinternetsales;

SELECT 
    OrderDateKey,
    YEAR(STR_TO_DATE(OrderDateKey, '%Y%m%d')) AS OrderYear, -- Extract year from OrderDateKey
    QUARTER(STR_TO_DATE(CONCAT(SUBSTRING(OrderDateKey, 1, 4), '-04-01'), '%Y-%m-%d')) AS FinancialQuarter -- Calculate financial quarter
FROM factinternetsales;
-- kpi 5
SELECT 
    UnitPrice,
    OrderQuantity,
    UnitpriceDiscountpct,
    (UnitPrice * OrderQuantity) - (UnitPrice * OrderQuantity * UnitpriceDiscountpct) AS SalesAmount
FROM factinternetsales;

select unitprice, orderquantity,
unitprice * orderquantity as productioncost
from factinternetsales;
-- kpi 6 
SELECT 
    SalesAmount,
    totalProductCost,
    SalesAmount - totalProductCost AS Profit
FROM factinternetsales;
-- kpi 7 
SELECT 
    MONTH(OrderDatekey) AS Month,
    SUM(SalesAmount) AS TotalSales
FROM 
    factinternetsales
GROUP BY 
    MONTH(OrderDatekey)
ORDER BY 
    MONTH(OrderDatekey);
    -- kpi 8
    select year(orderdatekey) As year,
    sum(SalesAmount) as totalsales
    from factinternetsales
    group by year(orderdatekey)
    order by year(orderdatekey);
    -- kpi 9
    SELECT 
    Quarter(OrderDatekey) AS Quarter,
    SUM(SalesAmount) AS TotalSales
FROM 
    factinternetsales
GROUP BY 
    quarter(OrderDatekey)
ORDER BY 
    quarter(OrderDatekey);
    -- kpi 10
SELECT ProductKey,SUM(UnitPrice * OrderQuantity * (1 - DiscountAmount)) AS Sales_amount,
    SUM(ProductStandardCost * OrderQuantity ) AS Production_Cost
FROM factinternetsales Group by productkey;

    
    
   





    










