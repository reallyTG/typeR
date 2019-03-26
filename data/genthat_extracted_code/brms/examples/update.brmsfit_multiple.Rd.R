library(brms)


### Name: update.brmsfit_multiple
### Title: Update 'brms' models based on multiple data sets
### Aliases: update.brmsfit_multiple

### ** Examples

## Not run: 
##D library(mice)
##D imp <- mice(nhanes2)
##D 
##D # initially fit the model 
##D fit_imp1 <- brm_multiple(bmi ~ age + hyp + chl, data = imp, chains = 1)
##D summary(fit_imp1)
##D 
##D # update the model using fewer predictors
##D fit_imp2 <- update(fit_imp1, formula. = . ~ hyp + chl, newdata = imp)
##D summary(fit_imp2)
## End(Not run)




