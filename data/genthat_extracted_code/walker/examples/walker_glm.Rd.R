library(walker)


### Name: walker_glm
### Title: Bayesian generalized linear regression with time-varying
###   coefficients
### Aliases: walker_glm

### ** Examples


## Not run: 
##D 
##D data("discoveries", package = "datasets")
##D out <- walker_glm(discoveries ~ -1 + 
##D   rw2(~ 1, beta_prior = c(0, 10), sigma_prior = c(0, 2), slope_prior = c(0, 2)), 
##D   distribution = "poisson", iter = 1000, chains = 1, refresh = 0)
##D 
##D plot_fit(out)
##D 
##D 
##D 
##D set.seed(1)
##D n <- 25
##D x <- rnorm(n, 1, 1)
##D beta <- cumsum(c(1, rnorm(n - 1, sd = 0.1)))
##D 
##D level <- -1
##D u <- sample(1:10, size = n, replace = TRUE)
##D y <- rpois(n, u * exp(level + beta * x))
##D ts.plot(y)
##D 
##D out <- walker_glm(y ~ -1 + rw1(~ x, beta_prior = c(0, 10), 
##D   sigma_prior = c(0, 10)), distribution = "poisson", 
##D   iter = 1000, chains = 1, refresh = 0)
##D print(out$stanfit, pars = "sigma_rw1") ## approximate results
##D if (require("diagis")) {
##D   weighted_mean(extract(out$stanfit, pars = "sigma_rw1")$sigma_rw1, 
##D     extract(out$stanfit, pars = "weights")$weights)
##D }
##D plot_coefs(out)
##D pp_check(out)
##D 
## End(Not run)
             



