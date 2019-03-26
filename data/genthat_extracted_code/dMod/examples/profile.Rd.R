library(dMod)


### Name: profile
### Title: Profile-likelihood (PL) computation
### Aliases: profile

### ** Examples

## Not run: 
##D 
##D ## Parameter transformation
##D trafo <- eqnvec(a = "exp(loga)", 
##D                 b = "exp(logb)", 
##D                 c = "exp(loga)*exp(logb)*exp(logc)")
##D p <- P(trafo)
##D 
##D ## Objective function
##D obj1 <- constraintL2(mu = c(a = .1, b = 1, c = 10), sigma = .6)
##D obj2 <- constraintL2(mu = c(loga = 0, logb = 0), sigma = 10)
##D obj <- obj1*p + obj2
##D 
##D ## Initialize parameters and obtain fit
##D pars <- c(loga = 1, logb = 1, logc = 1)
##D myfit <- trust(obj, pars, rinit = 1, rmax = 10)
##D myfit.fixed <- trust(obj, pars[-1], rinit = 1, rmax = 10, fixed = pars[1])
##D 
##D ## Compute profiles by integration method
##D profiles.approx <- do.call(
##D   rbind, 
##D   lapply(1:3, function(i) {
##D     profile(obj, myfit$argument, whichPar = i, limits = c(-3, 3),
##D             method = "integrate")
##D   })
##D )
##D 
##D ## Compute profiles by repeated optimization 
##D profiles.exact <- do.call(
##D   rbind, 
##D   lapply(1:3, function(i) {
##D     profile(obj, myfit$argument, whichPar = i, limits = c(-3, 3),
##D             method = "optimize")
##D   })
##D )
##D 
##D ## Compute profiles for fit with fixed element by integration method
##D profiles.approx.fixed <- do.call(
##D   rbind, 
##D   lapply(1:2, function(i) {
##D     profile(obj, myfit.fixed$argument, whichPar = i, limits = c(-3, 3),
##D             method = "integrate",
##D             fixed = pars[1])
##D   })
##D )
##D 
##D ## Plotting
##D plotProfile(profiles.approx)
##D plotProfile(list(profiles.approx, profiles.exact))
##D plotProfile(list(profiles.approx, profiles.approx.fixed))
##D 
##D plotPaths(profiles.approx, sort = TRUE)
##D plotPaths(profiles.approx, whichPar = "logc")
##D plotPaths(list(profiles.approx, profiles.approx.fixed), whichPar = "logc")
##D 
##D ## Confidence Intervals
##D confint(profiles.approx, val.column = "value")
##D 
## End(Not run)



