library(psycho)


### Name: standardize.glm
### Title: Standardize Coefficients.
### Aliases: standardize.glm

### ** Examples

## Not run: 
##D library(psycho)
##D fit <- glm(Sex ~ Adjusting, data = psycho::affective, family = "binomial")
##D fit <- lme4::glmer(Sex ~ Adjusting + (1 | Sex), data = psycho::affective, family = "binomial")
##D 
##D standardize(fit)
## End(Not run)




