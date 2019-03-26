library(Rlabkey)


### Name: labkey.getSchemas
### Title: Retrieve a list of available schemas from a labkey database
### Aliases: labkey.getSchemas
### Keywords: IO

### ** Examples

## No test: 

## List of schemas
# library(Rlabkey)

schemasDF <- labkey.getSchemas(
	baseUrl="http://localhost:8080/labkey",
	folderPath="/apisamples"
)

## End(No test)



