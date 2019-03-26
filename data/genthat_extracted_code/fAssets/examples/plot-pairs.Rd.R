library(fAssets)


### Name: plot-pairs
### Title: Assets Pairs Plot
### Aliases: pairsPlot assetsPairsPlot assetsCorgramPlot assetsCorTestPlot
###   assetsCorImagePlot
### Keywords: models

### ** Examples

## LPP2005REC -
   # Load Swiss Pension Fund Data:
   LPP <- LPP2005REC[, 1:6]
   head(LPP)   
   
## assetsPairsPlot -
   # Create Pairs Plot:  
   assetsPairsPlot(LPP)
  
## assetsCorgramPlot - 
   # Create Corellogram Plot:  
   assetsCorgramPlot(LPP, method = "pie")
   assetsCorgramPlot(LPP, method = "shade")
   
## assetsCorTestPlot - 
   # Create Correlation Test Plot: 
   assetsCorTestPlot(LPP)
   
## assetsCorImagePlot -
   # Create Correlation Image Plot: 
   assetsCorImagePlot(LPP)    



