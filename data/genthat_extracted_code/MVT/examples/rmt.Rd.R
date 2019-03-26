library(MVT)


### Name: rmt
### Title: Multivariate-t random deviates
### Aliases: rmt
### Keywords: distribution multivariate

### ** Examples

# covariance matrix
Sigma <- matrix(c(10,3,3,2), ncol = 2)
Sigma

# generate the sample
y <- rmt(n = 1000, Sigma = Sigma)

# scatterplot of a random bivariate t sample with mean vector
# zero and covariance matrix 'Sigma'
par(pty = "s")
plot(y, xlab = "", ylab = "")
title("bivariate t sample (eta = 0.25)", font.main = 1)



