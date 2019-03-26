library(blorr)


### Name: blr_step_aic_both
### Title: Stepwise AIC selection
### Aliases: blr_step_aic_both plot.blr_step_aic_both

### ** Examples

## Not run: 
##D model <- glm(y ~ ., data = stepwise)
##D 
##D # selection summary
##D blr_step_aic_both(model)
##D 
##D # print details at each step
##D blr_step_aic_both(model, details = TRUE)
##D 
##D # plot
##D plot(blr_step_aic_both(model))
##D 
##D # final model
##D k <- blr_step_aic_both(model)
##D k$model
##D 
## End(Not run)




