library(psycho)


### Name: get_predicted.merMod
### Title: Compute predicted values of lm models.
### Aliases: get_predicted.merMod

### ** Examples

## Not run: 
##D library(psycho)
##D library(ggplot2)
##D 
##D fit <- lmerTest::lmer(Tolerating ~ Adjusting + (1 | Salary), data = affective)
##D 
##D refgrid <- psycho::refdata(affective, "Adjusting")
##D predicted <- get_predicted(fit, newdata = refgrid)
##D 
##D ggplot(predicted, aes(x = Adjusting, y = Tolerating_Predicted)) +
##D   geom_line()
##D 
##D predicted <- get_predicted(fit, newdata = refgrid, prob = 0.95, iter = 100) # Takes a long time
##D 
##D ggplot(predicted, aes(x = Adjusting, y = Tolerating_Predicted)) +
##D   geom_line() +
##D   geom_ribbon(aes(
##D     ymin = Tolerating_CI_2.5,
##D     ymax = Tolerating_CI_97.5
##D   ),
##D   alpha = 0.1
##D   )
##D 
##D 
##D 
##D fit <- lme4::glmer(Sex ~ Adjusting + (1 | Salary), data = affective, family = "binomial")
##D 
##D refgrid <- psycho::refdata(affective, "Adjusting")
##D predicted <- get_predicted(fit, newdata = refgrid)
##D 
##D ggplot(predicted, aes(x = Adjusting, y = Sex_Predicted)) +
##D   geom_line()
##D 
##D predicted <- get_predicted(fit, newdata = refgrid, prob = 0.95, iter = 100) # Takes a long time
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



