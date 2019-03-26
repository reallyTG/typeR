library(DiscreteLaplace)


### Name: loss
### Title: Loss function for the method of moments
### Aliases: loss
### Keywords: distribution

### ** Examples

p <- 0.3
q <- 0.7
x <- rdlaplace2(n=100, p, q)
par <- estdlaplace2(x, "M")
loss(par, x) # should be near zero
loss(c(p,q), x) # may be far greater than zero



