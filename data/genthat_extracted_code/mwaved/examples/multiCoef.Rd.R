library(mwaved)


### Name: multiCoef
### Title: Wavelet coefficient estimation from a multichannel signal
### Aliases: multiCoef

### ** Examples

library(mwaved)
# Simulate the multichannel doppler signal.
m <- 3
n <- 2^10
signal <- makeDoppler(n)
# Noise levels per channel
e <- rnorm(m*n)
# Create Gamma blur
shape <- seq(from = 0.5, to = 1, length = m)
scale <- rep(0.25,m)
G <- gammaBlur(n, shape = shape, scale = scale)
# Convolve the signal
X <- blurSignal(signal, G)
# Create error with custom signal to noise ratio
SNR <- c(10,15,20)
sigma <- sigmaSNR(X, SNR)
if (requireNamespace("fracdiff", quietly = TRUE)) {
  alpha <- c(0.75, 0.8, 1)
} else {
  alpha <- rep(1, m)
}
E <- multiNoise(n, sigma, alpha)
# Create noisy & blurred multichannel signal
Y <- X + E
plot(signal, type='l', lty='dashed', main='dashed: True signal, solid: multichannel signals')
matlines(Y, lty = 1)
# Estimate the wavelet coefficients
estimatedCoefs <- multiCoef(Y, G, alpha = alpha)
plot(estimatedCoefs)
# Compute true wavelet coefficients
trueCoefs <- multiCoef(signal)
plot(trueCoefs)



