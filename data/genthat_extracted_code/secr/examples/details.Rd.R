library(secr)


### Name: details
### Title: Detail Specification for secr.fit
### Aliases: details fixedbeta LLonly param miscparm
### Keywords: models

### ** Examples

## Not run: 
##D ## Demo of miscparm and userdist
##D ## We fix the usual 'sigma' parameter and estimate the same 
##D ## quantity as miscparm[1]. Differences in CI reflect the implied use 
##D ## of the identity link for miscparm[1]. 
##D 
##D mydistfn3 <- function (xy1,xy2, mask) {
##D     if (missing(xy1)) return(character(0))
##D     xy1 <- as.matrix(xy1)
##D     xy2 <- as.matrix(xy2)
##D     miscparm <- attr(mask, 'miscparm')
##D     distmat <- edist(xy1,xy2) / miscparm[1]
##D     distmat
##D }
##D 
##D fit0 <- secr.fit (captdata)
##D fit <- secr.fit (captdata, fixed = list(sigma=1), details = 
##D     list(miscparm = c(sig = 20), userdist = mydistfn3))    
##D predict(fit0)
##D coef(fit)
## End(Not run)



