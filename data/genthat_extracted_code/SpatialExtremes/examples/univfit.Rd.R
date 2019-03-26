library(SpatialExtremes)


### Name: margin fits
### Title: Fits univariate extreme value distributions to data
### Aliases: gevmle gpdmle
### Keywords: htest

### ** Examples

## 1 - GEV fit
x <- rep(NA, 100)
for (i in 1:100)
  x[i] <- max(rnorm(365))

gevmle(x)

## 2- GPD fit
x <- rnorm(10000)
##we need to fix a threshold
u <- quantile(x, 0.99)
gpdmle(x, u)



