library(merDeriv)


### Name: llcont.lmerMod
### Title: Extract Case-wise Log Likelihoods for Linear Mixed Effects
###   Models
### Aliases: llcont.lmerMod

### ** Examples

## Not run: 
##D     # The sleepstudy example
##D     lme4fit <- lmer(Reaction ~ Days + (Days|Subject), sleepstudy, REML = FALSE)
##D 
##D     # clusterwise log likelihood
##D     llcont(lme4fit)
## End(Not run)  



