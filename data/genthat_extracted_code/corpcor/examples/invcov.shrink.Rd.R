library(corpcor)


### Name: invcov.shrink
### Title: Fast Computation of the Inverse of the Covariance and
###   Correlation Matrix
### Aliases: invcov.shrink invcor.shrink
### Keywords: multivariate

### ** Examples

# load corpcor library
library("corpcor")

# generate data matrix
p = 500
n = 10
X = matrix(rnorm(n*p), nrow = n, ncol = p)

lambda = 0.23  # some arbitrary lambda

# slow
system.time(
  (W1 =  solve(cov.shrink(X, lambda)))
)

# very fast
system.time(
  (W2 = invcov.shrink(X, lambda))
)

# no difference
sum((W1-W2)^2)



