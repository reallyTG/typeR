library(heavy)


### Name: rmnorm
### Title: Multivariate Normal Random Deviates
### Aliases: rmnorm
### Keywords: distribution multivariate

### ** Examples

# covariance parameters
Sigma <- matrix(c(10,3,3,2), ncol = 2)
Sigma

# generate the sample
y <- rmnorm(n = 1000, Sigma = Sigma)
var(y)

# scatterplot of a random bivariate normal sample with mean
# vector zero and covariance matrix 'Sigma'
par(pty = "s")
plot(y, xlab = "", ylab = "")
title("bivariate normal sample", font.main = 1)



