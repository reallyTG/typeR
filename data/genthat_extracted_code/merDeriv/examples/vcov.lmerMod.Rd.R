library(merDeriv)


### Name: vcov.lmerMod
### Title: Extract Variance-Covariance Matrix of all Parameters for Linear
###   Mixed Effects Models
### Aliases: vcov.lmerMod

### ** Examples

## Not run: 
##D     # The sleepstudy example
##D     lme4fit <- lmer(Reaction ~ Days + (Days|Subject), sleepstudy, REML = FALSE)
##D 
##D     # variance covariance matrix for all parameters
##D     vcov(lme4fit, full = TRUE)
## End(Not run)



