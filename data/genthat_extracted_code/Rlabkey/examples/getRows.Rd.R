library(Rlabkey)


### Name: getRows
### Title: Retrieve data from LabKey Server
### Aliases: getRows
### Keywords: file

### ** Examples

## No test: 

## simple example of getting data using schema objects
# library(Rlabkey)

s<-getSession(baseUrl="http://localhost:8080/labkey",
    folderPath="/apisamples")
s  # shows schemas

scobj <- getSchema(s, "lists")
scobj   # shows available queries

scobj$AllTypes  ## this is the query object

getRows(s, scobj$AllTypes)
	
## End(No test)



