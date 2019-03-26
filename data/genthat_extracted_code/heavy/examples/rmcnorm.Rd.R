library(heavy)


### Name: rmcnorm
### Title: Multivariate Contaminated Normal Random Deviates
### Aliases: rmcnorm
### Keywords: distribution multivariate

### ** Examples

# dispersion parameters
Scatter <- matrix(c(10,3,3,2), ncol = 2)
Scatter

# generate the sample
y <- rmcnorm(n = 1000, Scatter = Scatter, epsilon = .05, vif = .25)

# scatterplot of a random bivariate contaminated normal sample
# with center vector zero and scale matrix 'Scatter'
par(pty = "s")
plot(y, xlab = "", ylab = "")
title("bivariate contaminated normal sample", font.main = 1)



