library(Rlabkey)


### Name: labkey.getLookupDetails
### Title: Retrieve detailed information on a LabKey query
### Aliases: labkey.getLookupDetails
### Keywords: IO

### ** Examples

## No test: 

## Details  of fields of a query referenced by a lookup field
# library(Rlabkey)

lu1  <- labkey.getLookupDetails(
	baseUrl="http://localhost:8080/labkey",
	folderPath="/apisamples",
	schemaName="lists",
	queryName="AllTypes",
	lookupKey="Category"
)
lu1

## When a lookup field points to a query object that itself has a lookup
## field, use a compound fieldkey consisting of the lookup fields from
## the base query object to the target lookupDetails, separated by
## forward slashes
lu2<- labkey.getLookupDetails(
	baseUrl="http://localhost:8080/labkey",
	folderPath="/apisamples",
	schemaName="lists",
	queryName="AllTypes",
	lookupKey="Category/Group"
)
lu2

## Now select a result set containing a field from the base query, a
## field from the 1st level of lookup, and one from the 2nd
rows<- labkey.selectRows(
	baseUrl="http://localhost:8080/labkey",
	folderPath="/apisamples",
	schemaName="lists",
	queryName="AllTypes",
	colSelect=c("DisplayFld","Category/Category","Category/Group/GroupName"), 
	colFilter = makeFilter(c("Category/Group/GroupName",
	   "NOT_EQUALS","TypeRange")), maxRows=20
 )
 rows

## End(No test)



