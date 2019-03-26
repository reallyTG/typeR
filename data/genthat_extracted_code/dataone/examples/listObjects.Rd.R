library(dataone)


### Name: listObjects
### Title: Retrieve the list of objects that match the search parameters
### Aliases: listObjects listObjects,D1Node-method

### ** Examples

library(dataone)
cn <- CNode("STAGING")
fromDate <- "2013-01-01T01:01:01.000+00:00"
toDate <- "2015-12-31T01:01:01.000+00:00"
formatId <- "eml://ecoinformatics.org/eml-2.1.0"
start <- 0
count <- 5
objects <- listObjects(cn, fromDate=fromDate, toDate=toDate, 
    formatId=formatId, start=start, count=count)
# Inspect id of first object 
objects[1]$objectInfo$identifier



