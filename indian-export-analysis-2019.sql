select commodity, count(distinct country) from Expo
group by COMMODITY
order by count(distinct country) desc;




select commodity, max(QUANTITY) as commodity_getting_max_expo from expo
group by COMMODITY
order by max(QUANTITY)  desc;




select country, max(QUANTITY) as country_getting_max_expo from expo
group by COUNTRY
order by max(QUANTITY)  desc




select commodity, country, round(value, 2),
DENSE_RANK() over(partition by commodity order by value desc) as sales_rank
from expo;



select commodity, country, round(value, 2),
DENSE_RANK() over(partition by country order by value desc) as sales_rank
from expo;




with first as
(
select a.country, b.continent from expo a
left join continent b 
on a.country= b.country
)
select * from first
where first.continent is null;





with first as
(
select a.country, b.continent from expo a
left join continent b 
on a.country= b.country
)
select first.country from first
where first.continent is null
group by first.country;




INSERT INTO Continent(COUNTRY, CONTINENT)
VALUES ('ANTARTICA','ANTARTICA');



UPDATE Continent
SET COUNTRY = 'ANTARCTICA', CONTINENT = 'ANTARCTICA'
WHERE COUNTRY='ANTARTICA';



delete from island
where islands is null ;



SELECT 
    CASE 
        WHEN CHARINDEX('(', ISLANDS) > 0 THEN
            SUBSTRING(ISLANDS, 1, CHARINDEX('(', ISLANDS) - 1)
        WHEN CHARINDEX('[', ISLANDS) > 0 THEN
            SUBSTRING(ISLANDS, 1, CHARINDEX('[', ISLANDS) - 1)
        ELSE
            ISLANDS
    END AS ISLANDS
FROM 
    ISLAND









UPDATE EXPO 
SET COUNTRY='BAHRAIN'
WHERE COUNTRY='BAHARAIN IS'



DELETE FROM Continent
where country like '%China'









UPDATE ISLAND
SET ISLANDS = 
    CASE 
        WHEN CHARINDEX('(', ISLANDS) > 0 THEN
            SUBSTRING(ISLANDS, 1, CHARINDEX('(', ISLANDS) - 1)
        WHEN CHARINDEX('[', ISLANDS) > 0 THEN
            SUBSTRING(ISLANDS, 1, CHARINDEX('[', ISLANDS) - 1)
        ELSE
            ISLANDS
    END;








with first as
(
select commodity,
	a.country,
	CASE 
        WHEN continent IS NOT NULL THEN continent  
        ELSE cont  
    END AS Location_on_earth,
	a.Value
from expo a
left join continent b on a.country= b.country
left join ISLAND C on a.country= c.islands
)
SELECT * into #data from first;





UPDATE #data
SET location_on_earth = 'Others'
WHERE location_on_earth IS NULL;



CREATE TABLE dbo.ExportData (
    Commodity nvarchar(50),
    Country nvarchar(50),
	Continent nvarchar(50),
	Total_Value float
);
INSERT INTO dbo.ExportData (Commodity ,Country, Continent, Total_Value)
SELECT commodity, country, location_on_earth, value
FROM #data;

select * from exportdata;

drop table #data;

