library(fAssets)


### Name: plot-mst
### Title: Assets Tree Plot
### Aliases: treePlot assetsTreePlot
### Keywords: models

### ** Examples

## LPP2005REC -
   # Load Swiss Pension Fund Data:
   LPP <- LPP2005REC[, 1:6]
   head(LPP)   
   
## assetsTreePlot(LPP) - 
   # Create Minimum Spanning Tree Graph: assetsTreePlot -
   # par(mfrow = c(2, 2))
   assetsTreePlot(LPP)
   # new seeds ...
   for (i in 1:3) assetsTreePlot(LPP)



