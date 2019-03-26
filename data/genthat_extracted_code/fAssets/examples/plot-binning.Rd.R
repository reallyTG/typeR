library(fAssets)


### Name: plot-binning
### Title: Bivariate Histogram Plots of Assets
### Aliases: binningPlot assetsHistPairsPlot
### Keywords: models

### ** Examples

## LPP2005REC -
   # Load Swiss Pension Fund Data:
   LPP <- LPP2005REC
   head(LPP)
     
## assetsHistPairsPlot - 
   # Create a bivariate Binning Plot: assetsHistPairsPlot -
   assetsHistPairsPlot(LPP[, c("LMI", "ALT")])
   
## assetsHistPairsPlot -
   # Now with hexagonal Bins:
   assetsHistPairsPlot(LPP[, c("LMI", "ALT")], method = "hex")
   grid(col="red")



