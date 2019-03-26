library(fAssets)


### Name: assets-meancov
### Title: Estimation of Mean and Covariances of Asset Sets
### Aliases: assetsMeanCov getCenterRob getCovRob
### Keywords: models

### ** Examples

## LPP -
   LPP <- as.timeSeries(data(LPP2005REC))[, 1:6]
   colnames(LPP)
   
## Sample Covariance Estimation:
   assetsMeanCov(LPP)
   
## Shrinked Estimation:
   shrink <- assetsMeanCov(LPP, "shrink")
   shrink
   
## Extract Covariance Matrix:
   getCovRob(shrink)



