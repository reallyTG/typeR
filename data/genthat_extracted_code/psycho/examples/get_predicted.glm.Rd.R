library(psycho)


### Name: get_predicted.glm
### Title: Compute predicted values of lm models.
### Aliases: get_predicted.glm

### ** Examples

## Not run: 
##D library(psycho)
##D library(ggplot2)
##D 
##D fit <- glm(Sex ~ Adjusting, data = affective, family = "binomial")
##D 
##D refgrid <- psycho::refdata(affective, "Adjusting")
##D predicted <- get_predicted(fit, newdata = refgrid)
##D 
##D ggplot(predicted, aes(x = Adjusting, y = Sex_Predicted)) +
##D   geom_line() +
##D   geom_ribbon(aes(
##D     ymin = Sex_CI_2.5,
##D     ymax = Sex_CI_97.5
##D   ),
##D   alpha = 0.1
##D   )
## End(Not run)



