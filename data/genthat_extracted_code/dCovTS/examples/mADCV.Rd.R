library(dCovTS)


### Name: mADCV
### Title: Auto-Distance Covariance Matrix
### Aliases: mADCV
### Keywords: ts

### ** Examples

x <- MASS::mvrnorm(100,rep(0,2),diag(2))
mADCV(x,lags=1)
mADCV(x,lags=15)

y <- as.ts(swiss)
mADCV(y,15)
mADCV(y,15,unbiased=TRUE)



