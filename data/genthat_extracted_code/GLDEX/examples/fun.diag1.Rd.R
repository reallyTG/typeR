library(GLDEX)


### Name: fun.diag1
### Title: Diagnostic function for theoretical distribution fits through
###   the resample Kolmogorov-Smirnoff tests
### Aliases: fun.diag1
### Keywords: htest

### ** Examples

## Fits a Weibull 5,2 distribution:
# weibull.approx.ml<-fun.data.fit.ml(rweibull(1000,5,2))

## Compute the resample K-S test results.
# fun.diag1(weibull.approx.ml, rweibull(100000, 5, 2))



