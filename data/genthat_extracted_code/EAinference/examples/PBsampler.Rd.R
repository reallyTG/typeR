library(EAinference)


### Name: PBsampler
### Title: Parametric bootstrap sampler for lasso, group lasso, scaled
###   lasso or scaled group lasso estimator
### Aliases: PBsampler

### ** Examples

set.seed(1234)
n <- 10
p <- 30
Niter <-  10
Group <- rep(1:(p/10), each = 10)
Weights <- rep(1, p/10)
x <- matrix(rnorm(n*p), n)
#
# Using non-mixture distribution
#
PBsampler(X = x, PE_1 = rep(0, p), sig2_1 = 1, lbd_1 = .5,
 weights = Weights, group = Group, type = "grlasso", niter = Niter, parallel = FALSE)
PBsampler(X = x, PE_1 = rep(0, p), sig2_1 = 1, lbd_1 = .5,
 weights = Weights, group = Group, type = "grlasso", niter = Niter, parallel = TRUE)
#
# Using mixture distribution
#
PBsampler(X = x, PE_1 = rep(0, p), sig2_1 = 1, lbd_1 = .5,
 PE_2 = rep(1, p), sig2_2 = 2, lbd_2 = .3, weights = Weights,
 group = Group, type = "grlasso", niter = Niter, parallel = TRUE)



