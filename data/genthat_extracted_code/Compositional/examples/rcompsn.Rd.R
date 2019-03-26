library(Compositional)


### Name: Multivariate skew normal random values simulation on the simplex
### Title: Multivariate skew normal random values simulation on the simplex
### Aliases: rcompsn
### Keywords: multivariate skew normal distribution random values
###   simulation

### ** Examples

x <- as.matrix(iris[, 1:2])
par <- sn::msn.mle(y = x)$dp
y <- rcompsn(100, dp = par)
comp.den(y, dist = "skewnorm")
ternary(y)



