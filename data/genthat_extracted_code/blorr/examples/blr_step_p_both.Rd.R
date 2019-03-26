library(blorr)


### Name: blr_step_p_both
### Title: Stepwise regression
### Aliases: blr_step_p_both blr_step_p_both.default plot.blr_step_p_both

### ** Examples

## Not run: 
##D # stepwise regression
##D model <- glm(y ~ ., data = stepwise)
##D blr_step_p_both(model)
##D 
##D # stepwise regression plot
##D model <- glm(y ~ ., data = stepwise)
##D k <- blr_step_p_both(model)
##D plot(k)
##D 
##D # final model
##D k$model
##D 
## End(Not run)




