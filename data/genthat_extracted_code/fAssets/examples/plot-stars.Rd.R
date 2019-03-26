library(fAssets)


### Name: plot-stars
### Title: Stars Plots of Assets.
### Aliases: starsPlot assetsStarsPlot assetsBasicStatsPlot
###   assetsMomentsPlot assetsBoxStatsPlot assetsNIGFitPlot
### Keywords: models

### ** Examples

## LPP2005REC -
   # Load Swiss Pension Fund Data:
   LPP <- LPP2005REC
   head(LPP) 

## assetsBasicStatsPlot - 
   # Create a basic Stats Plot: assetsBasicStatsPlot -
   # par(mfrow = c(1, 1))
   assetsBasicStatsPlot(LPP, title = "", description = "")
   
## assetsMomentsPlot -
   # Create a Moments Plot: assetsMomentsPlot -
   assetsMomentsPlot(LPP, title = "", description = "")
   
## assetsBoxStatsPlot - 
   # Create a Box Stats Plot: assetsBoxStatsPlot -
   assetsBoxStatsPlot(LPP, title = "", description = "")

## assetsNIGFitPlot - 
   # Create a NIG Fit Plot: assetsNIGFitPlot -
   assetsNIGFitPlot(LPP[, 7:9], title = "", description = "")



