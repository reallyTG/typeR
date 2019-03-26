library(SpatialTools)


### Name: rcondnorm
### Title: Generate from conditional normal distribution
### Aliases: rcondnorm
### Keywords: normal multivariate conditional

### ** Examples

n <- 100
np <- 100

mu <- rep(1, 100)
mup <- rep(2, 100)

coords <- matrix(runif(2 * n), ncol = 2)
pcoords <- matrix(runif(2 * np), ncol = 2)

myV <- cov.sp(coords, sp.type = "exponential", c(1, 2), error.var = 1, pcoords = pcoords)

y <- rmvnorm(1, mu = mu, V = myV$V)

rcondnorm(3, y = y, mu = mu, mup = mup, V = myV$V, Vp = myV$Vp, Vop = myV$Vop, method = "chol")



