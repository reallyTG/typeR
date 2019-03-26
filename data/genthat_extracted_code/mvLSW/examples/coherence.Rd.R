library(mvLSW)


### Name: coherence
### Title: Local Wavelet Coherence and Partial Coherence
### Aliases: coherence
### Keywords: coherence

### ** Examples

## Sample tri-variate time series
##  Series 2 & 3 are dependent indirectly via Series 1
set.seed(100)
X <- matrix(rnorm(3 * 2^8), ncol = 3)
X[1:192, 2] <- X[1:192, 2] + 0.95 * X[1:192, 1]
X[65:256, 3] <- X[65:256, 3] - 0.95 * X[65:256, 1]
X <- as.ts(X)

## Evolutionary Wavelet Spectrum
EWS <- mvEWS(X, filter.number = 4, kernel.name = "daniell", 
  kernel.param = 20)

## Coherence
RHO <- coherence(EWS, partial = FALSE)
plot(RHO, style = 2, info = 1, ylab = "Coherence", diag = FALSE)

## Partial Coherence
PRHO <- coherence(EWS, partial = TRUE)
plot(PRHO, style = 2, info = 1, ylab = "P. Coh.", diag = FALSE) 
#series 2&3 are closer to 0



