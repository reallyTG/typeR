library(rust)


### Name: print.summary.ru
### Title: Print method for objects of class "summary.ru"
### Aliases: print.summary.ru

### ** Examples

# one-dimensional standard normal ----------------
x <- ru(logf = function(x) -x ^ 2 / 2, d = 1, n = 1000, init = 0)
summary(x)

# two-dimensional normal with positive association ----------------
rho <- 0.9
covmat <- matrix(c(1, rho, rho, 1), 2, 2)
log_dmvnorm <- function(x, mean = rep(0, d), sigma = diag(d)) {
  x <- matrix(x, ncol = length(x))
  d <- ncol(x)
  - 0.5 * (x - mean) %*% solve(sigma) %*% t(x - mean)
}
x <- ru(logf = log_dmvnorm, sigma = covmat, d = 2, n = 1000, init = c(0, 0))
summary(x)



