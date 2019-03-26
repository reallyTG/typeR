library(bayesplot)


### Name: bayesplot-extractors
### Title: Extract quantities needed for plotting from model objects
### Aliases: bayesplot-extractors log_posterior nuts_params rhat neff_ratio
###   log_posterior.stanfit log_posterior.stanreg nuts_params.stanfit
###   nuts_params.stanreg nuts_params.list rhat.stanfit rhat.stanreg
###   neff_ratio.stanfit neff_ratio.stanreg

### ** Examples

## Not run: 
##D library(rstanarm)
##D fit <- stan_glm(mpg ~ wt, data = mtcars)
##D 
##D np <- nuts_params(fit)
##D head(np)
##D tail(np)
##D 
##D lp <- log_posterior(fit)
##D head(lp)
##D tail(lp)
## End(Not run)




