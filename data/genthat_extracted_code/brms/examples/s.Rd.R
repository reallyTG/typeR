library(brms)


### Name: s
### Title: Defining smooths in 'brms' formulas
### Aliases: s t2

### ** Examples

## Not run: 
##D # simulate some data
##D dat <- mgcv::gamSim(1, n = 200, scale = 2)
##D 
##D # fit univariate smooths for all predictors
##D fit1 <- brm(y ~ s(x0) + s(x1) + s(x2) + s(x3), 
##D             data = dat, chains = 2)
##D summary(fit1)
##D plot(marginal_smooths(fit1), ask = FALSE)
##D 
##D # fit a more complicated smooth model
##D fit2 <- brm(y ~ t2(x0, x1) + s(x2, by = x3), 
##D             data = dat, chains = 2)
##D summary(fit2)
##D plot(marginal_smooths(fit2), ask = FALSE)
## End(Not run)




