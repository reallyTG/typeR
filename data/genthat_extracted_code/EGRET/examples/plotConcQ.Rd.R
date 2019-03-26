library(EGRET)


### Name: plotConcQ
### Title: Plot of Observed Concentration versus Discharge
### Aliases: plotConcQ
### Keywords: graphics statistics water-quality

### ** Examples

eList <- Choptank_eList
# Water year:
plotConcQ(eList)
plotConcQ(eList, logScale=TRUE)
# Graphs consisting of Jun-Aug
eList <- setPA(eList, paStart=6,paLong=3)
plotConcQ(eList)



