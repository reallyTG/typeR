library(fAssets)


### Name: plot-ellipses
### Title: Displays a Covariance Ellipses Plot
### Aliases: covEllipsesPlot
### Keywords: models

### ** Examples

## LPP -
   # Load Swiss Pension Fund Data:
   LPP <- LPP2005REC[, 1:6]
   head(LPP)
   
## assetsMeanCov -
   # Compute Robust Covariance Matrix: assetsMeanCov - 
   Cov <- cov(LPP)
   robustCov <- assetsMeanCov(LPP, "MCD")$Sigma
   
## covEllipsesPlot -
   # Create Covariance Ellipse Plot: 
   covEllipsesPlot(list(Cov, robustCov))  



