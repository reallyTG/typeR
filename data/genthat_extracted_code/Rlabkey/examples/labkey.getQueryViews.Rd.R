library(Rlabkey)


### Name: labkey.getQueryViews
### Title: Retrieve a list of available named views defined on a query in a
###   schema
### Aliases: labkey.getQueryViews
### Keywords: IO

### ** Examples

## No test: 

## List of views defined for a query in a schema
# library(Rlabkey)

viewsDF <- labkey.getQueryViews(
	baseUrl="http://localhost:8080/labkey",
	folderPath="/apisamples",
	schemaName="lists",
	queryName="AllTypes"
)

## End(No test)



