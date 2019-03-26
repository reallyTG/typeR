library(mvLSW)


### Name: summary.mvLSW
### Title: Print a Summary of mvLSW Object
### Aliases: summary.mvLSW print.mvLSW
### Keywords: summary.mvLSW, print.mvLSW

### ** Examples

## Generate a bivariate time series
set.seed(100)
X <- matrix(rnorm(2 * 2^8), ncol = 2)
X[1:2^7, 2] <- 3 * (X[1:2^7, 2] + 0.95 * X[1:2^7, 1])
X[-(1:2^7), 2] <- X[-(1:2^7), 2] - 0.95 * X[-(1:2^7), 1]
X[-(1:2^7), 1] <- X[-(1:2^7), 1] * 4
X <- as.ts(X)

## Haar wavelet, apply same smoothing to all levels & optimize
EWS <- mvEWS(X, kernel.name = "daniell", kernel.param = 20,
  optimize = TRUE)
summary(EWS)
print(EWS)
plot(EWS, style = 2, info = 1)



