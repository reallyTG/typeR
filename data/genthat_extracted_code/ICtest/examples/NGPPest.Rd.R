library(ICtest)


### Name: NGPPest
### Title: Signal Subspace Dimension Testing Using non-Gaussian Projection
###   Pursuit
### Aliases: NGPPest
### Keywords: multivariate

### ** Examples

# Iris data

X <- as.matrix(iris[, 1:4])

# The number of simulations N should be increased in practical situations
# Now we settle for N = 100

res <- NGPPest(X, N = 100)
res$statistic
res$p.value
res$conv



