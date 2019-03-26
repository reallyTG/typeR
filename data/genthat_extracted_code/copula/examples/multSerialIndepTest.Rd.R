library(copula)


### Name: multSerialIndepTest
### Title: Serial Independence Test for Multivariate Time Series via
###   Empirical Copula
### Aliases: multSerialIndepTest
### Keywords: htest

### ** Examples

## A multivariate time series {minimal example for demo purposes}
d <- 2
n <- 100 # sample size *and* "burn-in" size
param <- 0.25
A <- matrix(param,d,d) # the bivariate AR(1)-matrix
set.seed(17)
ar <- matrix(rnorm(2*n * d), 2*n,d) # used as innovations
for (i in 2:(2*n))
  ar[i,] <- A %*% ar[i-1,] + ar[i,]
## drop burn-in :
x <- ar[(n+1):(2*n),]

## Run the test
test <- multSerialIndepTest(x,3)
test

## Display the dependogram
dependogram(test,print=TRUE)



