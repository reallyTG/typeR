library(psycho)


### Name: get_predicted.stanreg
### Title: Compute predicted values of stanreg models.
### Aliases: get_predicted.stanreg

### ** Examples

## Not run: 
##D library(psycho)
##D library(ggplot2)
##D require(rstanarm)
##D 
##D fit <- rstanarm::stan_glm(Tolerating ~ Adjusting, data = affective)
##D 
##D refgrid <- psycho::refdata(affective, "Adjusting")
##D predicted <- get_predicted(fit, newdata = refgrid)
##D 
##D ggplot(predicted, aes(x = Adjusting, y = Tolerating_Median)) +
##D   geom_line() +
##D   geom_ribbon(aes(
##D     ymin = Tolerating_CI_5,
##D     ymax = Tolerating_CI_95
##D   ),
##D   alpha = 0.1
##D   )
##D 
##D fit <- rstanarm::stan_glm(Sex ~ Adjusting, data = affective, family = "binomial")
##D 
##D refgrid <- psycho::refdata(affective, "Adjusting")
##D predicted <- get_predicted(fit, newdata = refgrid)
##D 
##D ggplot(predicted, aes(x = Adjusting, y = Sex_Median)) +
##D   geom_line() +
##D   geom_ribbon(aes(
##D     ymin = Sex_CI_5,
##D     ymax = Sex_CI_95
##D   ),
##D   alpha = 0.1
##D   )
## End(Not run)



