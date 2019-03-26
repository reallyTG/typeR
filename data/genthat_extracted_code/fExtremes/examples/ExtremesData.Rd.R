library(fExtremes)


### Name: ExtremesData
### Title: Explorative Data Analysis
### Aliases: ExtremesData emdPlot qqparetoPlot mePlot mrlPlot mxfPlot
###   msratioPlot recordsPlot ssrecordsPlot sllnPlot lilPlot xacfPlot
###   normMeanExcessFit ghMeanExcessFit hypMeanExcessFit nigMeanExcessFit
###   ghtMeanExcessFit
### Keywords: hplot

### ** Examples
 
## Danish fire insurance data:
   data(danishClaims)
   danishClaims = as.timeSeries(danishClaims)
   
## emdPlot -
   # Show Pareto tail behaviour:
   par(mfrow = c(2, 2), cex = 0.7)
   emdPlot(danishClaims) 
   
## qqparetoPlot -
   # QQ-Plot of heavy-tailed Danish fire insurance data:
   qqparetoPlot(danishClaims, xi = 0.7) 
 
## mePlot -
   # Sample mean excess plot of heavy-tailed Danish fire:
   mePlot(danishClaims)
      
## ssrecordsPlot -
   # Record fire insurance losses in Denmark:
   ssrecordsPlot(danishClaims, subsamples = 10) 



