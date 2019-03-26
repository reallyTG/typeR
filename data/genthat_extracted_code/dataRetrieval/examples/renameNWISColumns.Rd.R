library(dataRetrieval)


### Name: renameNWISColumns
### Title: renameColumns
### Aliases: renameNWISColumns
### Keywords: IO manip

### ** Examples

siteWithTwo <- '01480015'
startDate <- "2012-09-01"
endDate <- "2012-10-01"
## Not run: 
##D url2 <- constructNWISURL(siteWithTwo, "00060",startDate,endDate,'dv')
##D twoResults <- importWaterML1(url2,TRUE)
##D twoResults <- renameNWISColumns(twoResults)
##D url2RDB <- constructNWISURL(siteWithTwo,"00060",
##D          startDate,endDate,"dv",format="tsv")
##D rdbResults <- importRDB1(url2RDB)
##D rdbResults <- renameNWISColumns(rdbResults) 
## End(Not run)



