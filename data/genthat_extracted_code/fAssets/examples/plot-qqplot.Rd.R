library(fAssets)


### Name: plot-qqplot
### Title: Normal Quantile-Quantile Plots
### Aliases: assetsQQNormPlot
### Keywords: models

### ** Examples

## LPP2005REC -
   # Load Swiss Pension Fund Data:
   LPP <- LPP2005REC
   head(LPP) 
    
## assetsQQNormPlot -
   # Create normal Quantile-Quantile Plot: 
   # par(mfrow = c(2, 2))
   assetsQQNormPlot(LPP[, 1:3])



