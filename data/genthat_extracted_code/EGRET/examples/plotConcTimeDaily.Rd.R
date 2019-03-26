library(EGRET)


### Name: plotConcTimeDaily
### Title: Plot of the time series of daily concentration estimates and the
###   sample values for the days that were sampled
### Aliases: plotConcTimeDaily
### Keywords: graphics statistics water-quality

### ** Examples

eList <- Choptank_eList
# Water year:
plotConcTimeDaily(eList)
plotConcTimeDaily(eList, yearStart=1998,yearEnd=2001)
# Graphs consisting of Jun-Aug
eList <- setPA(eList, paStart=6,paLong=3)
plotConcTimeDaily(eList)



