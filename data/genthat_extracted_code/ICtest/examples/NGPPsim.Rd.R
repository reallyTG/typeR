library(ICtest)


### Name: NGPPsim
### Title: Signal Subspace Dimension Testing Using non-Gaussian Projection
###   Pursuit
### Aliases: NGPPsim
### Keywords: multivariate

### ** Examples

# Simulated data with 2 signals and 2 noise components

n <- 200
S <- cbind(rexp(n), rbeta(n, 1, 2), rnorm(n), rnorm(n))
A <- matrix(rnorm(16), ncol = 4)
X <- S %*% t(A)

# The number of simulations N should be increased in practical situations
# Now we settle for N = 100

res1 <- NGPPsim(X, 1, N = 100)
res1
screeplot(res1)

res2 <- NGPPsim(X, 2, N = 100)
res2
screeplot(res2)



