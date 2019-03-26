library(blorr)


### Name: blr_step_aic_forward
### Title: Stepwise AIC forward selection
### Aliases: blr_step_aic_forward blr_step_aic_forward.default
###   plot.blr_step_aic_forward

### ** Examples

## Not run: 
##D model <- glm(honcomp ~ female + read + science, data = hsb2,
##D family = binomial(link = 'logit'))
##D 
##D # selection summary
##D blr_step_aic_forward(model)
##D 
##D # print details of each step
##D blr_step_aic_forward(model, details = TRUE)
##D 
##D # plot
##D plot(blr_step_aic_forward(model))
##D 
##D # final model
##D k <- blr_step_aic_forward(model)
##D k$model
##D 
## End(Not run)




