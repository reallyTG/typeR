library(EGRET)


### Name: plotResidPred
### Title: Plot of the residuals from WRTDS versus the estimated values
###   (all in log concentration units)
### Aliases: plotResidPred
### Keywords: graphics statistics water-quality

### ** Examples

eList <- Choptank_eList
# Water year:
plotResidPred(eList)
# Graphs consisting of Jun-Aug
eList <- setPA(eList, paStart=6,paLong=3)
plotResidPred(eList)



