library(EGRET)


### Name: plotResidTime
### Title: Plot of the residuals from WRTDS (in log concentration units)
###   versus time
### Aliases: plotResidTime
### Keywords: graphics statistics water-quality

### ** Examples

eList <- Choptank_eList
# Water year:
plotResidTime(eList)
# Graphs consisting of Jun-Aug
eList <- setPA(eList, paStart=6,paLong=3)
plotResidTime(eList)



