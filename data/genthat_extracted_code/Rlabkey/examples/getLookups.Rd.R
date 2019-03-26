library(Rlabkey)


### Name: getLookups
### Title: Get related data fields that are available to include in a query
###   on a given query object
### Aliases: getLookups
### Keywords: file

### ** Examples

## No test: 

##  get fields from lookup tables and add to query
# library(Rlabkey)

s<- getSession(baseUrl="http://localhost:8080/labkey",
    folderPath="/apisamples")
 
scobj <- getSchema(s, "lists")

# can add fields from related queries
lucols <- getLookups(s, scobj$AllTypes$Category)

# keep going to other tables
lucols2 <- getLookups(s, lucols[["Category/Group"]])

cols <- c(names(scobj$AllTypes)[2:6], names(lucols)[2:4])

getRows(s, scobj$AllTypes, colSelect=paste(cols, sep=","))

## End(No test)



