library(ICtest)


### Name: NGPP
### Title: Non-Gaussian Projection Pursuit
### Aliases: NGPP
### Keywords: multivariate

### ** Examples

# Simulated data with 2 signals

n <- 500
S <- cbind(rexp(n), runif(n),  rnorm(n))
A <- matrix(rnorm(9), ncol = 3)
X <- S %*% t(A)

res <- NGPP(X, 2)
res$W %*% A


# Iris data

X <- as.matrix(iris[, 1:4])

res <- NGPP(X, 2, nl = c("pow3", "tanh"), alpha = 0.5)
plot(res, col = iris[, 5])



