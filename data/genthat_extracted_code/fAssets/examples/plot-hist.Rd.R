library(fAssets)


### Name: plot-hist
### Title: Histogram Plots of Assets
### Aliases: histPlot assetsHistPlot assetsLogDensityPlot
### Keywords: models

### ** Examples

## LPP2005REC -
   # Load Swiss Pension Fund Data:
   x <- LPP2005REC
   head(x)   
  
## assetsHistPlot - 
   # Create Histogram Plot: assetsHistPlot -
   # par(mfrow = c(2, 2))
   assetsHistPlot(x[, 1:4])
   
## assetsLogDensityPlot -
   #Create Log Density Plot: assetsLogDensityPlot -
   # par(mfrow = c(1, 1))
   assetsLogDensityPlot(x[, "ALT"], estimator = "both")



