library(ProFit)


### Name: profitMakePriors
### Title: Make a Priors Function
### Aliases: profitMakePriors
### Keywords: prior

### ** Examples

## Not run: 
##D params = c(50,50,0,5,1,0,0.5,0)
##D 
##D modellist=list(
##D   sersic=list(
##D     xcen= params[1], ycen=params[2],
##D     mag= params[3], re=params[4],
##D     nser=params[5], ang=params[6],
##D     axrat=params[7], box=params[8]
##D   )
##D )
##D 
##D tolog=list(
##D   sersic=list(
##D     xcen=FALSE, ycen=FALSE,
##D     mag=FALSE, re=TRUE,
##D     nser=TRUE, ang=FALSE,
##D     axrat=TRUE, box=FALSE
##D   )
##D )
##D 
##D # Setup s.d. = 1 for linear and 0.1 dex for logged parameters
##D linear = unlist(tolog)
##D sigmas = unlist(modellist)
##D sigmas[which(linear)] = 0.1
##D sigmas[which(!linear)] = 1
##D sigmas = relist(sigmas, modellist)
##D 
##D #Make the list structure of prior function:
##D priors=profitMakePriors(modellist, sigmas, tolog)
##D 
##D #Check that the priors return the expected likelihood:
##D stopifnot(abs(priors(modellist,modellist) - sum(dnorm(0,0,unlist(sigmas),log=TRUE)))
##D < 10*.Machine$double.eps)
## End(Not run)



