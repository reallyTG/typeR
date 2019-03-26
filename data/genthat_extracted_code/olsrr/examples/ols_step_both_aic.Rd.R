library(olsrr)


### Name: ols_step_both_aic
### Title: Stepwise AIC regression
### Aliases: ols_step_both_aic plot.ols_step_both_aic ols_stepaic_both

### ** Examples

## Not run: 
##D # stepwise regression
##D model <- lm(y ~ ., data = stepdata)
##D ols_step_both_aic(model)
##D 
##D # stepwise regression plot
##D model <- lm(y ~ ., data = stepdata)
##D k <- ols_step_both_aic(model)
##D plot(k)
##D 
##D # final model
##D k$model
##D 
## End(Not run)



