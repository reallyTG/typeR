library(heavy)


### Name: rsphere
### Title: Generation of Deviates Uniformly Located on a Spherical Surface
### Aliases: rsphere
### Keywords: distribution multivariate

### ** Examples

# generate the sample
z <- rsphere(n = 200)

# scatterplot of a random sample of 200 points uniformly distributed
# on the unit circle
par(pty = "s")
plot(z, xlab = "x", ylab = "y")
title("200 points on the circle", font.main = 1)



