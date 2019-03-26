library(HDCI)


### Name: mls
### Title: Modified Least Squares
### Aliases: mls

### ** Examples

library("mvtnorm") 

## generate the data
set.seed(2015)
n <- 200      # number of obs
p <- 500
s <- 10
beta <- rep(0, p)
beta[1:s] <- runif(s, 1/3, 1)
x <- rmvnorm(n = n, mean = rep(0, p), method = "svd")
signal <- sqrt(mean((x %*% beta)^2))
sigma <- as.numeric(signal / sqrt(10))  # SNR=10
y <- x %*% beta + rnorm(n)

## modified Least Squares
set.seed(0)
obj <- mls(x = x[, 1:20], y = y)
# the OLS estimate of the regression coefficients
obj$beta
# intercept term
obj$beta0
# prediction
mypredict(obj, newx = matrix(rnorm(10*20), 10, 20))




