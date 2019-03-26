library(fExtremes)


### Name: ExtremeIndex
### Title: Extremal Index Estimation
### Aliases: ExtremeIndex fTHETA fTHETA-class show,fTHETA-method thetaSim
###   blockTheta clusterTheta runTheta ferrosegersTheta exindexPlot
###   exindexesPlot
### Keywords: hplot

### ** Examples

## Extremal Index for the right and left tails 
## of the BMW log returns:
   data(bmwRet)
   par(mfrow = c(2, 2), cex = 0.7)
   exindexPlot( as.timeSeries(bmwRet), block = "quarterly")
   exindexPlot(-as.timeSeries(bmwRet), block = "quarterly")   
   
## Extremal Index for the right and left tails 
## of the BMW log returns:
   exindexesPlot( as.timeSeries(bmwRet), block = 65)
   exindexesPlot(-as.timeSeries(bmwRet), block = 65)   



