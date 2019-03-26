library(brms)


### Name: fitted.brmsfit
### Title: Extract Model Fitted Values of 'brmsfit' Objects
### Aliases: fitted.brmsfit posterior_linpred.brmsfit posterior_linpred

### ** Examples

## Not run: 
##D ## fit a model
##D fit <- brm(rating ~ treat + period + carry + (1|subject), 
##D            data = inhaler)
##D 
##D ## extract fitted values
##D fitted_values <- fitted(fit)
##D head(fitted_values)
##D 
##D ## plot fitted means against actual response
##D dat <- as.data.frame(cbind(Y = standata(fit)$Y, fitted_values))
##D ggplot(dat) + geom_point(aes(x = Estimate, y = Y))
## End(Not run)




