library(brms)


### Name: fixef.brmsfit
### Title: Extract Population-Level Estimates
### Aliases: fixef.brmsfit fixef

### ** Examples

## Not run: 
##D fit <- brm(time | cens(censored) ~ age + sex + disease, 
##D            data = kidney, family = "exponential")
##D fixef(fit)
##D # extract only some coefficients
##D fixef(fit, pars = c("age", "sex"))
## End(Not run)




