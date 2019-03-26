library(mwaved)


### Name: multiEstimate
### Title: Wavelet deconvolution signal estimate from the noisy
###   multichannel convoluted signal
### Aliases: multiEstimate

### ** Examples

library(mwaved)
# Simulate the multichannel doppler signal.
m <- 3
n <- 2^10
x <- (1:n)/n
signal <- makeDoppler(n)
# Noise levels per channel
e <- rnorm(m * n)
# Create Gamma blur
shape <- seq(from = 0.5, to = 1, length = m)
scale <- rep(0.25, m)
G <- gammaBlur(n, shape = shape, scale = scale)
# Convolve the signal
X <- blurSignal(signal, G)
# Create error with custom signal to noise ratio
SNR <- c(10, 15, 20)
sigma <- sigmaSNR(X, SNR)
if (requireNamespace("fracdiff", quietly = TRUE)) {
  alpha <- c(0.75, 0.8, 1)
} else {
  alpha <- rep(1, m)
}
E <- multiNoise(n, sigma, alpha)
# Create noisy & blurred multichannel signal
Y <- X + E
# Estimate the underlying doppler signal
dopplerEstimate <- multiEstimate(Y, G = G, alpha = rep(1, m))
# Plot the result and compare with truth
par(mfrow=c(2, 1))
matplot(x, Y, type = 'l', main = 'Noisy multichannel signal')
plot(x, signal, type = 'l', lty = 2, main = 'True Doppler signal and estimate', col = 'red')
lines(x, dopplerEstimate)



