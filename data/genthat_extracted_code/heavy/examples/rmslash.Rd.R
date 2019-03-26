library(heavy)


### Name: rmslash
### Title: Multivariate Slash Random Deviates
### Aliases: rmslash
### Keywords: distribution multivariate

### ** Examples

# dispersion parameters
Scatter <- matrix(c(10,3,3,2), ncol = 2)
Scatter

# generate the sample
y <- rmslash(n = 1000, Scatter = Scatter)

# scatterplot of a random bivariate slash sample with center
# vector zero and scale matrix 'Scatter'
par(pty = "s")
plot(y, xlab = "", ylab = "")
title("bivariate slash sample (df = 2)", font.main = 1)



