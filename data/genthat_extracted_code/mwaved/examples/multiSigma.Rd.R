library(mwaved)


### Name: multiSigma
### Title: Noise level estimation among multichannel signal
### Aliases: multiSigma

### ** Examples

library(mwaved)
# Simulate matrix of Gaussian variables with three different noise levels
sig <- c(0.25, 0.5, 1.25)
n <- 1024
Y <- sapply(1:3, function(i) sig[i]* rnorm(n))
# Estimate the noise levels
multiSigma(Y, deg = 3)



