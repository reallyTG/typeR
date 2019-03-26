library(sjstats)


### Name: tidy_stan
### Title: Tidy summary output for stan models
### Aliases: tidy_stan

### ** Examples

## Not run: 
##D if (require("rstanarm")) {
##D   fit <- stan_glm(mpg ~ wt + am, data = mtcars, chains = 1)
##D   tidy_stan(fit)
##D   tidy_stan(fit, prob = c(.89, .5))
##D }
## End(Not run)




