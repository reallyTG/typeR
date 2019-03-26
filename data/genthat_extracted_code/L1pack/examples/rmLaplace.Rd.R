library(L1pack)


### Name: rmLaplace
### Title: Multivariate Laplace Random Deviates
### Aliases: rmLaplace
### Keywords: distribution multivariate

### ** Examples

# dispersion parameters
Scatter <- matrix(c(1,.5,.5,1), ncol = 2)
Scatter

# generate the sample
y <- rmLaplace(n = 2000, Scatter = Scatter)

# scatterplot of a random bivariate Laplace sample with center
# vector zero and scale matrix 'Scatter'
par(pty = "s")
plot(y, xlab = "", ylab = "")
title("bivariate Laplace sample", font.main = 1)



