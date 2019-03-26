library(EGRET)


### Name: plotResidQ
### Title: Plot of the residuals from WRTDS (in log concentration units)
###   versus the discharge
### Aliases: plotResidQ
### Keywords: graphics statistics water-quality

### ** Examples

eList <- Choptank_eList
# Water year:
plotResidQ(eList)
# Graphs consisting of Jun-Aug
eList <- setPA(eList, paStart=6,paLong=3)
plotResidQ(eList)



