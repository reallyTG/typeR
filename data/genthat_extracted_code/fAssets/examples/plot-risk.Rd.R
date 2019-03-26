library(fAssets)


### Name: plot-risk
### Title: Assets Risk Plots
### Aliases: seriesPlots assetsRiskReturnPlot assetsNIGShapeTrianglePlot
### Keywords: models

### ** Examples

## LPP2005REC -
   # Load Swiss Pension Fund Data:
   LPP <- LPP2005REC
   head(LPP) 
   
## assetsRiskReturnPlot -
   # Create Risk/Return Plot: 
   # par(mfrow = c(2, 2))
   assetsRiskReturnPlot(LPP)
   
## assetsNIGShapeTrianglePlot -
   # Create NIG Shape Triangle Plot: 
   assetsNIGShapeTrianglePlot(LPP)



