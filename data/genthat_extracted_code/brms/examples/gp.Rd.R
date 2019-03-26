library(brms)


### Name: gp
### Title: Set up Gaussian process terms in 'brms'
### Aliases: gp

### ** Examples

## Not run: 
##D # simulate data using the mgcv package
##D dat <- mgcv::gamSim(1, n = 30, scale = 2)
##D 
##D # fit a simple GP model
##D fit1 <- brm(y ~ gp(x2), dat, chains = 2)
##D summary(fit1)
##D me1 <- marginal_effects(fit1, nsamples = 200, spaghetti = TRUE)
##D plot(me1, ask = FALSE, points = TRUE)
##D 
##D # fit a more complicated GP model
##D fit2 <- brm(y ~ gp(x0) + x1 + gp(x2) + x3, dat, chains = 2)
##D summary(fit2)
##D me2 <- marginal_effects(fit2, nsamples = 200, spaghetti = TRUE)
##D plot(me2, ask = FALSE, points = TRUE)
##D 
##D # fit a multivariate GP model
##D fit3 <- brm(y ~ gp(x1, x2), dat, chains = 2)
##D summary(fit3)
##D me3 <- marginal_effects(fit3, nsamples = 200, spaghetti = TRUE)
##D plot(me3, ask = FALSE, points = TRUE)
##D 
##D # compare model fit
##D LOO(fit1, fit2, fit3)
##D 
##D # simulate data with a factor covariate
##D dat2 <- mgcv::gamSim(4, n = 90, scale = 2)
##D 
##D # fit separate gaussian processes for different levels of 'fac'
##D fit4 <- brm(y ~ gp(x2, by = fac), dat2, chains = 2)
##D summary(fit4)
##D plot(marginal_effects(fit4), points = TRUE)
## End(Not run)




