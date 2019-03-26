library(evidence)


### Name: looicplot
### Title: A dot plot is produced for several related models showing for
###   each model its LOOIC-value with its credible interval.
### Aliases: looicplot

### ** Examples

## Not run: 
##D data(budworm)
##D Mbudworm1 <- stan_glm(formula = cbind(dead, 20 - dead) ~ ldose,
##D                       family = binomial, data = budworm,
##D                       prior = student_t(df = 7),
##D                       prior_intercept = student_t(df = 7))
##D Mbudworm2 <- stan_glm(formula = cbind(dead, 20 - dead) ~ ldose * sex,
##D                       family = binomial, data = budworm,
##D                       prior = student_t(df = 7),
##D                       prior_intercept = student_t(df = 7))
##D Mbudworm3 <- stan_glm(formula = cbind(dead, 20 - dead) ~ ldose + sex,
##D                       family = binomial, data = budworm,
##D                       prior = student_t(df = 7),
##D                       prior_intercept = student_t(df = 7))
##D looicplot(looiclist = list("Mbudworm1", "Mbudworm2", "Mbudworm3"),
##D           modnames = c("~ ldose", "~ ldose + sex", "~ ldose * sex") )
## End(Not run)



