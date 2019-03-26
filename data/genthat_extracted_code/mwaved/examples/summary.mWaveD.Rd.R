library(mwaved)


### Name: summary.mWaveD
### Title: Summary Output for the mWaveD object
### Aliases: summary.mWaveD

### ** Examples

library(mwaved)
# Simulate the multichannel doppler signal.
m <- 3
n <- 2^10
t <- (1:n)/n
signal <- makeDoppler(n)
# Create multichannel version with smooth blur
shape <- seq(from = 0.5, to = 1, length = m)
scale <- rep(0.25, m)
G <- gammaBlur(n, shape, scale)
X <- blurSignal(signal, G)
# Add noise with custom signal to noise ratio
SNR <- c(10,15,20)
E <- multiNoise(n, sigma = sigmaSNR(X, SNR), alpha = c(0.5, 0.75, 1))
# Create noisy & blurred multichannel signal
Y <- X + E
mWaveDObject <- multiWaveD(Y, G)
summary(mWaveDObject)



