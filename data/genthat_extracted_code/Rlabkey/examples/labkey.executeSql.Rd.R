library(Rlabkey)


### Name: labkey.executeSql
### Title: Retrieve data from a LabKey Server using SQL commands
### Aliases: labkey.executeSql
### Keywords: IO

### ** Examples

## No test: 

## Example of an expicit join and use of group by and aggregates
# library(Rlabkey)

sql<- "SELECT AllTypesCategories.Category AS Category, 
    SUM(AllTypes.IntFld) AS SumOfIntFld,
    AVG(AllTypes.DoubleFld) AS AvgOfDoubleFld
    FROM AllTypes LEFT JOIN AllTypesCategories
    ON (AllTypes.Category = AllTypesCategories.TextKey)
    WHERE AllTypes.Category IS NOT NULL
    GROUP BY AllTypesCategories.Category"

sqlResults <- labkey.executeSql(
    baseUrl="http://localhost:8080/labkey",
    folderPath="/apisamples",
    schemaName="lists",
    sql = sql)

sqlResults

## End(No test)



