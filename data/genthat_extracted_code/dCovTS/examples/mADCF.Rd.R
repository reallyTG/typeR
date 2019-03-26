library(dCovTS)


### Name: mADCF
### Title: Auto-Distance Correlation Matrix
### Aliases: mADCF
### Keywords: ts

### ** Examples

x <- MASS::mvrnorm(100,rep(0,2),diag(2))
mADCF(x,2)

mADCF(x,-2)

mADCF(x,lags=4,unbiased=TRUE)



