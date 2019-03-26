library(walker)


### Name: walker_rw1
### Title: Comparison of naive and state space implementation of RW1
###   regression model
### Aliases: walker_rw1

### ** Examples

## Not run: 
##D ## Comparing the approaches, note that with such a small data 
##D ## the differences aren't huge, but try same with n = 500 and/or more terms...
##D set.seed(123)
##D n <- 100
##D beta1 <- cumsum(c(0.5, rnorm(n - 1, 0, sd = 0.05)))
##D beta2 <- cumsum(c(-1, rnorm(n - 1, 0, sd = 0.15)))
##D x1 <- rnorm(n, 1)
##D x2 <- 0.25 * cos(1:n)
##D ts.plot(cbind(beta1 * x1, beta2 *x2), col = 1:2)
##D u <- cumsum(rnorm(n))
##D y <- rnorm(n, u + beta1 * x1 + beta2 * x2)
##D ts.plot(y)
##D lines(u + beta1 * x1 + beta2 * x2, col = 2)
##D kalman_walker <- walker_rw1(y ~ -1 + 
##D   rw1(~ x1 + x2, beta_prior = c(0, 2), sigma_prior = c(0, 2)), 
##D   sigma_y_prior = c(0, 2), iter = 2000, chains = 1)
##D print(kalman_walker$stanfit, pars = c("sigma_y", "sigma_rw1"))
##D betas <- extract(kalman_walker$stanfit, "beta")[[1]]
##D ts.plot(cbind(u, beta1, beta2, apply(betas, 2, colMeans)), 
##D   col = 1:3, lty = rep(2:1, each = 3))
##D sum(get_elapsed_time(kalman_walker$stanfit))
##D naive_walker <- walker_rw1(y ~ x1 + x2, iter = 2000, chains = 1, 
##D   beta_prior = cbind(0, rep(2, 3)), sigma_prior = cbind(0, rep(2, 4)), 
##D   naive = TRUE)
##D print(naive_walker$stanfit, pars = c("sigma_y", "sigma_b"))
##D sum(get_elapsed_time(naive_walker$stanfit))
##D 
##D ## Larger problem, this takes some time with naive approach
##D 
##D set.seed(123)
##D n <- 500
##D beta1 <- cumsum(c(1.5, rnorm(n - 1, 0, sd = 0.05)))
##D beta2 <- cumsum(c(-1, rnorm(n - 1, 0, sd = 0.5)))
##D beta3 <- cumsum(c(-1.5, rnorm(n - 1, 0, sd = 0.15)))
##D beta4 <- 2
##D x1 <- rnorm(n, 1)
##D x2 <- 0.25 * cos(1:n)
##D x3 <- runif(n, 1, 3)
##D ts.plot(cbind(beta1 * x1, beta2 * x2, beta3 * x3), col = 1:3)
##D a <- cumsum(rnorm(n))
##D signal <- a + beta1 * x1 + beta2 * x2 + beta3 * x3
##D y <- rnorm(n, signal)
##D ts.plot(y)
##D lines(signal, col = 2)
##D kalman_walker <- walker_rw1(y ~ x1 + x2 + x3, iter = 2000, chains = 1,
##D   beta_prior = cbind(0, rep(2, 4)), sigma_prior = cbind(0, rep(2, 5)))
##D print(kalman_walker$stanfit, pars = c("sigma_y", "sigma_b"))
##D betas <- extract(kalman_walker$stanfit, "beta")[[1]]
##D ts.plot(cbind(u, beta1, beta2, beta3, apply(betas, 2, colMeans)), 
##D   col = 1:4, lty = rep(2:1, each = 4))
##D sum(get_elapsed_time(kalman_walker$stanfit))
##D # need to increase adapt_delta in order to get rid of divergences
##D # and max_treedepth to get rid of related warnings
##D # and still we end up with low BFMI warning after hours of computation
##D naive_walker <- walker_rw1(y ~ x1 + x2 + x3, iter = 2000, chains = 1, 
##D   beta_prior = cbind(0, rep(2, 4)), sigma_prior = cbind(0, rep(2, 5)),
##D   naive = TRUE, control = list(adapt_delta = 0.9, max_treedepth = 15)) 
##D print(naive_walker$stanfit, pars = c("sigma_y", "sigma_b"))
##D sum(get_elapsed_time(naive_walker$stanfit))
## End(Not run)




