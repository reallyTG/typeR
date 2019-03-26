library(npcp)


### Name: cpU
### Title: Some CUSUM Tests for Change-Point Detection Based on
###   U-statistics
### Aliases: cpMean cpVar cpGini cpAutocov cpCov cpTau
### Keywords: htest multivariate nonparametric ts

### ** Examples

## The standard CUSUM test based on the sample mean
cp <- cpMean(c(rnorm(50), rnorm(50, mean=1)), b=1)
cp
## Estimated change-point
which(cp$statistics == cp$statistic)

## Testing for changes in the autocovariance
n <- 200
k <- n/2 ## the true change-point
x <- c(arima.sim(list(ar = -0.5), n = k),
       arima.sim(list(ar = 0.5), n = n - k))
cp <- cpAutocov(x)
cp
## Estimated change-point
which(cp$u == cp$statistic)
## Another example
x <- c(arima.sim(list(ar = c(0,-0.5)), n = k),
       arima.sim(list(ar = c(0,0.5)), n = n - k))
cpAutocov(x)
cp <- cpAutocov(x, lag = 2)
cp
## Estimated change-point
which(cp$u == cp$statistic)

## Not run: 
##D ## Testing for changes in Kendall's tau
##D require(copula)
##D n <- 100
##D k <- 50 ## the true change-point
##D u <- rCopula(k,gumbelCopula(1.5))
##D v <- rCopula(n-k,gumbelCopula(3))
##D x <- rbind(u,v)
##D cp <- cpTau(x)
##D cp
##D ## Estimated change-point
##D which(cp$u == cp$statistic)
##D 
##D ## Testing for changes in the covariance
##D cp <- cpCov(x)
##D cp
##D ## Estimated change-point
##D which(cp$u == cp$statistic)
## End(Not run)



