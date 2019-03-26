library(brms)


### Name: brm_multiple
### Title: Run the same 'brms' model on multiple datasets
### Aliases: brm_multiple

### ** Examples

## Not run: 
##D library(mice)
##D imp <- mice(nhanes2)
##D 
##D # fit the model using mice and lm
##D fit_imp1 <- with(lm(bmi~age+hyp+chl), data = imp)
##D summary(pool(fit_imp1))
##D 
##D # fit the model using brms
##D fit_imp2 <- brm_multiple(bmi~age+hyp+chl, data = imp, chains = 1)
##D summary(fit_imp2)
##D plot(fit_imp2, pars = "^b_")
##D # investigate convergence of the original models
##D fit_imp2$rhats
##D 
##D # use the future package for parallelization
##D library(future)
##D plan(multiprocess)
##D fit_imp3 <- brm_multiple(bmi~age+hyp+chl, data = imp, chains = 1)
##D summary(fit_imp3)
## End(Not run)




