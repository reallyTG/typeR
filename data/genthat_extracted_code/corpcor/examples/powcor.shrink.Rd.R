library(corpcor)


### Name: powcor.shrink
### Title: Fast Computation of the Power of the Shrinkage Correlation
###   Matrix
### Aliases: powcor.shrink crossprod.powcor.shrink
### Keywords: multivariate

### ** Examples

# load corpcor library
library("corpcor")

# generate data matrix
p = 500
n = 10
X = matrix(rnorm(n*p), nrow = n, ncol = p)

lambda = 0.23  # some arbitrary lambda

### computing the inverse ###
# slow
system.time(
  (W1 = solve(cor.shrink(X, lambda=lambda)))
)

# very fast
system.time(
  (W2 = powcor.shrink(X, alpha=-1, lambda=lambda))
)

# no difference
sum((W1-W2)^2)

### computing the square root ###

system.time(
  (W1 = mpower(cor.shrink(X, lambda=lambda), alpha=0.5))
)

# very fast
system.time(
  (W2 = powcor.shrink(X, alpha=0.5, lambda=lambda))
)

# no difference
sum((W1-W2)^2)


### computing an arbitrary power (alpha=1.23) ###

system.time(
  (W1 = mpower(cor.shrink(X, lambda=lambda), alpha=1.23))
)

# very fast
system.time(
  (W2 = powcor.shrink(X, alpha=1.23, lambda=lambda))
)

# no difference
sum((W1-W2)^2)


### fast computation of cross product

y = rnorm(p)

system.time(
  (CP1 = crossprod(powcor.shrink(X, alpha=1.23, lambda=lambda), y))
)

system.time(
  (CP2 = crossprod.powcor.shrink(X, y, alpha=1.23, lambda=lambda))
)

# no difference
sum((CP1-CP2)^2)




