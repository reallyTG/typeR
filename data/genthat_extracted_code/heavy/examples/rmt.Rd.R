library(heavy)


### Name: rmt
### Title: Multivariate Student-t Random Deviates
### Aliases: rmt
### Keywords: distribution multivariate

### ** Examples

# dispersion parameters
Scatter <- matrix(c(10,3,3,2), ncol = 2)
Scatter

# generate the sample
y <- rmt(n = 1000, Scatter = Scatter)

# scatterplot of a random bivariate Student-t sample with center
# vector zero and scale matrix 'Scatter'
par(pty = "s")
plot(y, xlab = "", ylab = "")
title("bivariate Student-t sample (df = 4)", font.main = 1)



