library(greta)


### Name: joint
### Title: define joint distributions
### Aliases: joint

### ** Examples

## Not run: 
##D # an uncorrelated bivariate normal
##D x <- joint(normal(-3, 0.5), normal(3, 0.5))
##D m <- model(x)
##D plot(mcmc(m, n_samples = 500))
##D 
##D # joint distributions can be used to define densities over data
##D x <- cbind(rnorm(10, 2, 0.5), rbeta(10, 3, 3))
##D mu <- normal(0, 10)
##D sd <- normal(0, 3, truncation = c(0, Inf))
##D a <- normal(0, 3, truncation = c(0, Inf))
##D b <- normal(0, 3, truncation = c(0, Inf))
##D distribution(x) <- joint(normal(mu, sd), beta(a, b),
##D                          dim = 10)
##D m <- model(mu, sd, a, b)
##D plot(mcmc(m))
## End(Not run)



