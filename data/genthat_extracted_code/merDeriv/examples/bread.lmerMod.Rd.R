library(merDeriv)


### Name: bread.lmerMod
### Title: Extract Bread Component for Huber-White Sandwich Estimator of
###   Linear Mixed Effects Models
### Aliases: bread.lmerMod

### ** Examples

## Not run: 
##D     # The sleepstudy example
##D     lme4fit <- lmer(Reaction ~ Days + (Days|Subject), sleepstudy, REML = FALSE)
##D 
##D     # bread component for all parameters
##D     bread(lme4fit, full = TRUE)
## End(Not run)



