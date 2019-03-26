library(rust)


### Name: plot.ru
### Title: Plot diagnostics for an ru object
### Aliases: plot.ru

### ** Examples

# Log-normal density ----------------
x <- ru(logf = dlnorm, log = TRUE, d = 1, n = 1000, lower = 0, init = 1)

## Not run: 
##D plot(x)
## End(Not run)

# Improve appearance using arguments to plot() and hist()
## Not run: 
##D plot(x, breaks = seq(0, ceiling(max(x$sim_vals)), by = 0.25),
##D   xlim = c(0, 10))
## End(Not run)

# Two-dimensional normal with positive association ----------------
rho <- 0.9
covmat <- matrix(c(1, rho, rho, 1), 2, 2)
log_dmvnorm <- function(x, mean = rep(0, d), sigma = diag(d)) {
  x <- matrix(x, ncol = length(x))
  d <- ncol(x)
  - 0.5 * (x - mean) %*% solve(sigma) %*% t(x - mean)
}
x <- ru(logf = log_dmvnorm, sigma = covmat, d = 2, n = 1000, init = c(0, 0))

## Not run: 
##D plot(x)
## End(Not run)



