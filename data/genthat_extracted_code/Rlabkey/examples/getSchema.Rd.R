library(Rlabkey)


### Name: getSchema
### Title: Returns an object representing a LabKey schema
### Aliases: getSchema
### Keywords: file

### ** Examples

## No test: 

## the basics of using session, schema, and query objects
# library(Rlabkey)

s<- getSession(baseUrl="http://localhost:8080/labkey",
    folderPath="/apisamples")

sch<- getSchema(s, "lists")

# can walk down the populataed schema tree from schema node or query node
sch$AllTypes$Category
sch$AllTypes$Category$caption
sch$AllTypes$Category$type

# can add fields from related queries
lucols <- getLookups(s, sch$AllTypes$Category)

cols <- c(names(sch$AllTypes[2:6]), names(lucols)[2:4])

getRows(s, sch$AllTypes, colSelect=cols)

## End(No test)



