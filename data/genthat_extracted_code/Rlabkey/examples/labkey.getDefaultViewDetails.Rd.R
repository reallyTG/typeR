library(Rlabkey)


### Name: labkey.getDefaultViewDetails
### Title: Retrieve the fields of a LabKey query view
### Aliases: labkey.getDefaultViewDetails
### Keywords: IO

### ** Examples

## No test: 

## Details  of fields of a default query view
# library(Rlabkey)

queryDF <- labkey.getDefaultViewDetails(
	baseUrl="http://localhost:8080/labkey",
	folderPath="/apisamples",
	schemaName="lists",
	queryName="AllTypes")
	
queryDF

## End(No test)



