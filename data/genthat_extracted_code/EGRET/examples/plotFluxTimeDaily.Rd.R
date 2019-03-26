library(EGRET)


### Name: plotFluxTimeDaily
### Title: Plot of the time series of daily flux estimates and the sample
###   values for the days that were sampled
### Aliases: plotFluxTimeDaily
### Keywords: graphics statistics water-quality

### ** Examples

eList <- Choptank_eList
# Water year:
plotFluxTimeDaily(eList)
plotFluxTimeDaily(eList, 2001,2009)
# Graphs consisting of Jun-Aug
eList <- setPA(eList, paStart=6,paLong=3)
plotFluxTimeDaily(eList)



