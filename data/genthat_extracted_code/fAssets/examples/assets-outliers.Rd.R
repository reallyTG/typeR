library(fAssets)


### Name: assets-outliers
### Title: Detection of Outliers in Asset Sets
### Aliases: assetsOutliers
### Keywords: models

### ** Examples

## LPP -
   LPP <- as.timeSeries(data(LPP2005REC))[, 1:6]
   colnames(LPP)
   
## assetsOutliers -
   assetsOutliers(LPP, colMeans(LPP), cov(LPP))



