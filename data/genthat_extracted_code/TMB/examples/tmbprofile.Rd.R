library(TMB)


### Name: tmbprofile
### Title: Adaptive likelihood profiling.
### Aliases: tmbprofile

### ** Examples

## Not run: 
##D runExample("simple",thisR=TRUE)
##D ## Parameter names for this model:
##D ## beta   beta   logsdu   logsd0
##D 
##D ## Profile wrt. sigma0:
##D prof <- tmbprofile(obj,"logsd0")
##D plot(prof)
##D confint(prof)
##D 
##D ## Profile the difference between the beta parameters (name is optional):
##D prof2 <- tmbprofile(obj,name="beta1 - beta2",lincomb = c(1,-1,0,0))
##D plot(prof2)
##D confint(prof2)
## End(Not run)



