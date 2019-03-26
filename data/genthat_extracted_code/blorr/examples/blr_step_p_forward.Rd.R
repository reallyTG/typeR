library(blorr)


### Name: blr_step_p_forward
### Title: Stepwise forward regression
### Aliases: blr_step_p_forward blr_step_p_forward.default
###   plot.blr_step_p_forward

### ** Examples

## Not run: 
##D # stepwise forward regression
##D model <- glm(honcomp ~ female + read + science, data = hsb2,
##D   family = binomial(link = 'logit'))
##D blr_step_p_forward(model)
##D 
##D # stepwise forward regression plot
##D model <- glm(honcomp ~ female + read + science, data = hsb2,
##D   family = binomial(link = 'logit'))
##D k <- blr_step_p_forward(model)
##D plot(k)
##D 
##D # final model
##D k$model
##D 
## End(Not run)




