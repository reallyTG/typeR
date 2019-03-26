library(psycho)


### Name: analyze.glmerMod
### Title: Analyze glmerMod objects.
### Aliases: analyze.glmerMod

### ** Examples

## Not run: 
##D library(psycho)
##D library(lme4)
##D 
##D fit <- lme4::glmer(vs ~ wt + (1 | gear), data = mtcars, family = "binomial")
##D 
##D results <- analyze(fit)
##D summary(results)
##D print(results)
## End(Not run)




