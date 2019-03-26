library(brms)


### Name: mmc
### Title: Multi-Membership Covariates
### Aliases: mmc

### ** Examples

## Not run: 
##D # simulate some data
##D dat <- data.frame(
##D   y = rnorm(100), x1 = rnorm(100), x2 = rnorm(100),
##D   g1 = sample(1:10, 100, TRUE), g2 = sample(1:10, 100, TRUE)
##D )
##D 
##D # multi-membership model with level specific covariate values
##D dat$xc <- (dat$x1 + dat$x2) / 2 
##D fit <- brm(y ~ xc + (1 + mmc(x1, x2) | mm(g1, g2)), data = dat)
##D summary(fit)
## End(Not run)




