library(psycho)


### Name: analyze.stanreg
### Title: Analyze stanreg objects.
### Aliases: analyze.stanreg

### ** Examples

## Not run: 
##D library(psycho)
##D library(rstanarm)
##D 
##D data <- attitude
##D fit <- rstanarm::stan_glm(rating ~ advance + privileges, data = data)
##D 
##D results <- analyze(fit, effsize = TRUE)
##D summary(results)
##D print(results)
##D plot(results)
##D 
##D 
##D fit <- rstanarm::stan_lmer(Sepal.Length ~ Sepal.Width + (1 | Species), data = iris)
##D results <- analyze(fit)
##D summary(results)
##D 
##D fit <- rstanarm::stan_glm(Sex ~ Adjusting,
##D   data = psycho::affective, family = "binomial"
##D )
##D results <- analyze(fit)
##D summary(results)
##D 
##D fit <- rstanarm::stan_glmer(Sex ~ Adjusting + (1 | Salary),
##D   data = psycho::affective, family = "binomial"
##D )
##D results <- analyze(fit)
##D summary(results)
## End(Not run)




