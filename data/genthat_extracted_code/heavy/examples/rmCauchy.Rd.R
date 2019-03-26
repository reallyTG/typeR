library(heavy)


### Name: rmCauchy
### Title: Multivariate Cauchy Random Deviates
### Aliases: rmCauchy
### Keywords: distribution multivariate

### ** Examples

# dispersion parameters
Scatter <- matrix(c(10,3,3,2), ncol = 2)
Scatter

# generate the sample
y <- rmCauchy(n = 1000, Scatter = Scatter)

# scatterplot of a random bivariate Cauchy sample with center
# vector zero and scale matrix 'Scatter'
par(pty = "s")
plot(y, xlab = "", ylab = "")
title("bivariate Cauchy sample", font.main = 1)



