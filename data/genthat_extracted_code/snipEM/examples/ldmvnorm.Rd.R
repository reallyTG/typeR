library(snipEM)


### Name: ldmvnorm
### Title: Multivariate Normal Log-Density for Complete and Incomplete Data
### Aliases: ldmvnorm

### ** Examples

## Not run: 
##D x <- matrix(rnorm(1000),100, 10)
##D u <- matrix(rbinom(1000, 1, 0.1), 100, 10)
##D x[ u == 1 ] <- NA
##D mu <- rep(0,10)
##D Sigma <- diag(10)
##D ldmvnorm(x, mu, Sigma)
## End(Not run)


