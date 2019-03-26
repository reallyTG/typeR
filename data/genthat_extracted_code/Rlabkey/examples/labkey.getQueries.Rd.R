library(Rlabkey)


### Name: labkey.getQueries
### Title: Retrieve a list of available queries for a specified LabKey
###   schema
### Aliases: labkey.getQueries
### Keywords: IO

### ** Examples


## List of queries in a schema
# library(Rlabkey)

queriesDF <- labkey.getQueries(
	baseUrl="http://www.labkey.org",
	folderPath="/home",
	schemaName="lists"
)
queriesDF




