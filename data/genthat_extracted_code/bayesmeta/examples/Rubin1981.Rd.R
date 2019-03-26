library(bayesmeta)


### Name: Rubin1981
### Title: 8-schools example data
### Aliases: Rubin1981
### Keywords: datasets

### ** Examples

data("Rubin1981")

## Not run: 
##D # analysis using weakly informative half-Cauchy prior
##D # (may take a few seconds to compute!):
##D schools <- bayesmeta(y=Rubin1981[,"effect"], sigma=Rubin1981[,"stderr"],
##D                      labels=Rubin1981[,"school"],
##D                      tau.prior=function(x){return(dhalfcauchy(x, scale=25))})
##D 
##D # show summary:
##D summary(schools)
##D 
##D # show shrinkage effect for 8 individual estimates:
##D schools$theta
## End(Not run)



