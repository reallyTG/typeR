library(tsdecomp)


### Name: acov2ma
### Title: Convert Autocovariances to Coefficients of a Moving Average
### Aliases: acov2ma acov2ma.init
### Keywords: ts

### ** Examples

set.seed(123)
x <- arima.sim(n=200, model=list(ma=c(0.7,-0.3)))
#sample autocovariances
a <- c(var(x), cov(x[-1], x[-200]), cov(x[-c(1,2)], x[-c(199,200)]))
#inferred coefficients and variance
acov2ma(a, init=acov2ma.init(a, maxit=10)$macoefs)
#compare with maximum-likelihood
arima(x, order=c(2,0,0), include.mean=FALSE)



