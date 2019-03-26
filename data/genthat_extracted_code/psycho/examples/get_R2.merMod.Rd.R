library(psycho)


### Name: get_R2.merMod
### Title: R2 and adjusted R2 for GLMMs.
### Aliases: get_R2.merMod

### ** Examples

## Not run: 
##D library(psycho)
##D 
##D fit <- lmerTest::lmer(Tolerating ~ Adjusting + (1 | Sex),
##D   data = psycho::affective
##D )
##D fit <- lme4::glmer(Sex ~ Adjusting + (1 | Salary),
##D   data = na.omit(psycho::affective), family = "binomial"
##D )
##D 
##D get_R2(fit)
## End(Not run)




