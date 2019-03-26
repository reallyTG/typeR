library(fAssets)


### Name: plot-boxplot
### Title: Displays a Box Plot of Assets
### Aliases: boxPlot assetsBoxPlot assetsBoxPercentilePlot
### Keywords: models

### ** Examples

## LPP -
   # Load Swiss Pension Fund Data:
   LPP <- LPP2005REC[, 1:6]
   head(LPP)
   
## assetsBoxPlot - 
   # Create a Boxplot: assetsBoxPlot - 
   assetsBoxPlot(LPP)
       
## assetsBoxPercentilePlot - 
   # Create a Box Percentile Plot: assetsBoxPercentilePlot - 
   assetsBoxPercentilePlot(LPP)  
   grid(NA, NULL, col="red")



