library(fAssets)


### Name: plot-series
### Title: Displays Series Plots of Assets.
### Aliases: seriesPlot assetsReturnPlot assetsCumulatedPlot
###   assetsSeriesPlot
### Keywords: models

### ** Examples

## LPP2005REC -
   # Load Swiss Pension Fund Data:
   LPP <- LPP2005REC
   head(LPP) 
    
## assetsReturnPlot -
   # Create Return Series Plot: 
   # par(mfrow = c(3, 2))
   assetsReturnPlot(LPP[, 1:3])
   
## assetsCumulatedPlot -
   # Create Cumulated Price/Index Plot: 
   assetsCumulatedPlot(LPP[, "LPP40"], col = "red")

## assetsSeriesPlot  
   # Crete Time Series Plot: 
   assetsSeriesPlot(LPP[, c("LMI", "ALT")], 
     col = c("orange", "brown"))



