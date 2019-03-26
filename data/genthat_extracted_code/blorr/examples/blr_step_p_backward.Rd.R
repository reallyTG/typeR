library(blorr)


### Name: blr_step_p_backward
### Title: Stepwise backward regression
### Aliases: blr_step_p_backward blr_step_p_backward.default
###   plot.blr_step_p_backward

### ** Examples

## Not run: 
##D # stepwise backward regression
##D model <- glm(honcomp ~ female + read + science + math + prog + socst,
##D   data = hsb2, family = binomial(link = 'logit'))
##D blr_step_p_backward(model)
##D 
##D # stepwise backward regression plot
##D model <- glm(honcomp ~ female + read + science + math + prog + socst,
##D   data = hsb2, family = binomial(link = 'logit'))
##D k <- blr_step_p_backward(model)
##D plot(k)
##D 
##D # final model
##D k$model
##D 
## End(Not run)




