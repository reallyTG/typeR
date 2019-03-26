library(Rlabkey)


### Name: labkey.getQueryDetails
### Title: Retrieve detailed information on a LabKey query
### Aliases: labkey.getQueryDetails
### Keywords: IO

### ** Examples

## No test: 

## Details  of fields of a query
# library(Rlabkey)

queryDF<-labkey.getQueryDetails(
	baseUrl="http://localhost:8080/labkey",
	folderPath="/apisamples",
	schemaName="lists",
	queryName="AllTypes")

## End(No test)



