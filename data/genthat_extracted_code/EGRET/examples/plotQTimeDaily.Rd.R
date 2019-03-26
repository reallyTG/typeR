library(EGRET)


### Name: plotQTimeDaily
### Title: Plot of the discharge time series
### Aliases: plotQTimeDaily
### Keywords: graphics streamflow

### ** Examples

eList <- Choptank_eList
# Water year:
plotQTimeDaily(eList)
plotQTimeDaily(eList, yearStart=1990, yearEnd=2000,qLower=1500)
plotQTimeDaily(eList, prettyDate=FALSE)
# Graphs consisting of Jun-Aug
eList <- setPA(eList, paStart=6,paLong=3)
plotQTimeDaily(eList)



