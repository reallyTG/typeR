library(IUPS)


### Name: bpsr
### Title: Bayesian Propensity Score Regression
### Aliases: bpsr

### ** Examples

## Not run: 
##D library(boot)
##D 
##D a = 2; b = c(1, -2, 5); N = 500
##D x1 <- runif(N, 0, 1)
##D x2 <- runif(N, 0, 1)
##D X <- cbind(rep(1, N), x1, x2)
##D p <- inv.logit( X %*% b )
##D t <- rbinom(N, 1, p)
##D e <- rnorm(N, 0, 1)
##D Y <- 5 * t + a * ( x1 + x2 ) + e
##D bpsr(Y, t, X )
## End(Not run)



