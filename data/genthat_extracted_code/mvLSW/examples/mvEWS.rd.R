library(mvLSW)


### Name: mvEWS
### Title: Multivariate Evolutionary Wavelet Spectrum
### Aliases: mvEWS
### Keywords: mvEWS

### ** Examples

## Sample bivariate locally stationary time series
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
plot(EWS, style = 2, info = 1)

## Over smoothed EWS
EWS_smooth <- mvEWS(X, filter.number = 10, family = "DaubLeAsymm",
  kernel.name = "modified.daniell", kernel.param = c(5, 5),
  optimize = FALSE)
summary(EWS_smooth)
plot(EWS_smooth, style = 2, info = 1)



