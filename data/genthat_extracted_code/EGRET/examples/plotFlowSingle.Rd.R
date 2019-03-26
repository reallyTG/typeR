library(EGRET)


### Name: plotFlowSingle
### Title: Creates a plot of a time series of a particular flow statistic
###   and a lowess smooth of that flow statistic
### Aliases: plotFlowSingle
### Keywords: graphics statistics streamflow

### ** Examples

eList <- Choptank_eList
# Water year:
plotFlowSingle(eList, 1)
# Graphs consisting of Jun-Aug
eList <- setPA(eList, paStart=6,paLong=3)
plotFlowSingle(eList, 1)
## Not run: 
##D siteNumber <- '01010000'
##D StartDate <- ''
##D EndDate <- '2014-10-01'
##D Daily <- readNWISDaily(siteNumber, '00060', StartDate, EndDate)
##D INFO <- readNWISInfo(siteNumber, '00060', interactive = FALSE)
##D eList <- as.egret(INFO, Daily)
##D plotFlowSingle(eList, 5)
## End(Not run)



