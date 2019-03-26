library(carcass)


### Name: shapeparameter
### Title: Shapeparameters of a beta-distribution from the mean, the lower
###   and upper limit of the 95% confidence or credible interval
### Aliases: shapeparameter
### Keywords: methods misc

### ** Examples


a <- shapeparameter(0.8, 0.72, 0.88)$a
b <- shapeparameter(0.8, 0.72, 0.88)$b
x <- seq(0, 1, by=0.01)
y <- dbeta(x, a, b)
plot(x, y, type="l")




