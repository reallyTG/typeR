library(mwaved)


### Name: multiThresh
### Title: Resolution level thresholds for hard thresholded wavelet
###   deconvolution estimator
### Aliases: multiThresh

### ** Examples

library(mwaved)
# Simulate the multichannel doppler signal.
m <- 3
n <- 2^10
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
alpha <- c(0.75, 0.8, 1)
E <- multiNoise(n, sigma, alpha)
# Create noisy & blurred multichannel signal
Y <- X + E
# Determine thresholds blur = 'smooth'
thresh <- multiThresh(Y, G)




