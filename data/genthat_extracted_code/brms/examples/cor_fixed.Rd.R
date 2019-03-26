library(brms)


### Name: cor_fixed
### Title: Fixed user-defined covariance matrices
### Aliases: cor_fixed cov_fixed

### ** Examples

## Not run: 
##D dat <- data.frame(y = rnorm(3))
##D V <- cbind(c(0.5, 0.3, 0.2), c(0.3, 1, 0.1), c(0.2, 0.1, 0.2))
##D fit <- brm(y~1, data = dat, autocor = cor_fixed(V))
## End(Not run)




