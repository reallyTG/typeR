library(EGRET)


### Name: plotConcPred
### Title: Plot of Observed Concentration versus Estimated Concentration
### Aliases: plotConcPred
### Keywords: graphics statistics water-quality

### ** Examples

eList <- Choptank_eList
# Water year:
plotConcPred(eList)
plotConcPred(eList, logScale=TRUE)
# Graphs consisting of Jun-Aug
eList <- setPA(eList, paStart=6,paLong=3)
plotConcPred(eList)



