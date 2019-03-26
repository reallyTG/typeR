library(merDeriv)


### Name: estfun.lmerMod
### Title: Extract Case-wise and Cluster-wise Derivatives for Linear Mixed
###   Effects Models
### Aliases: estfun.lmerMod

### ** Examples

## Not run: 
##D     # The sleepstudy example
##D     lme4fit <- lmer(Reaction ~ Days + (Days|Subject), sleepstudy, REML = FALSE)
##D 
##D     # casewise scores
##D     estfun(lme4fit, level = 1)
##D 
##D     # clusterwise scores
##D     estfun(lme4fit, level = 2)
## End(Not run)



