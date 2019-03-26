library(psycho)


### Name: get_predicted.lm
### Title: Compute predicted values of lm models.
### Aliases: get_predicted.lm

### ** Examples

## Not run: 
##D library(psycho)
##D library(ggplot2)
##D 
##D fit <- lm(Tolerating ~ Adjusting, data = affective)
##D 
##D refgrid <- psycho::refdata(affective, "Adjusting")
##D predicted <- get_predicted(fit, newdata = refgrid)
##D 
##D ggplot(predicted, aes(x = Adjusting, y = Tolerating_Predicted)) +
##D   geom_line() +
##D   geom_ribbon(aes(
##D     ymin = Tolerating_CI_2.5,
##D     ymax = Tolerating_CI_97.5
##D   ),
##D   alpha = 0.1
##D   )
## End(Not run)



