library(blorr)


### Name: blr_step_aic_backward
### Title: Stepwise AIC backward elimination
### Aliases: blr_step_aic_backward blr_step_aic_backward.default
###   plot.blr_step_aic_backward

### ** Examples

## Not run: 
##D model <- glm(honcomp ~ female + read + science + math + prog + socst,
##D data = hsb2, family = binomial(link = 'logit'))
##D 
##D # elimination summary
##D blr_step_aic_backward(model)
##D 
##D # print details of each step
##D blr_step_aic_backward(model, details = TRUE)
##D 
##D # plot
##D plot(blr_step_aic_backward(model))
##D 
##D # final model
##D k <- blr_step_aic_backward(model)
##D k$model
##D 
## End(Not run)




