library(brms)


### Name: update.brmsfit
### Title: Update 'brms' models
### Aliases: update.brmsfit

### ** Examples

## Not run: 
##D fit1 <- brm(time | cens(censored) ~ age * sex + disease + (1|patient), 
##D             data = kidney, family = gaussian("log"))
##D summary(fit1)
##D 
##D ## remove effects of 'disease'
##D fit2 <- update(fit1, formula. = ~ . - disease)
##D summary(fit2)
##D 
##D ## remove the group specific term of 'patient' and
##D ## change the data (just take a subset in this example)
##D fit3 <- update(fit1, formula. = ~ . - (1|patient), 
##D                newdata = kidney[1:38, ])
##D summary(fit3)
##D 
##D ## use another family and add population-level priors
##D fit4 <- update(fit1, family = weibull(), inits = "0",
##D                prior = set_prior("normal(0,5)"))
##D summary(fit4)
## End(Not run)




