library(extRemes)


### Name: findpars
### Title: Get EVD Parameters
### Aliases: findpars findpars.fevd findpars.fevd.bayesian
###   findpars.fevd.lmoments findpars.fevd.mle
### Keywords: manip list methods

### ** Examples

z <- revd(100, loc=20, scale=0.5, shape=-0.2)
fit <- fevd(z)
fit

findpars(fit)

## Not run: 
##D data(PORTw)
##D fit <- fevd(TMX1, PORTw, location.fun=~AOindex, units="deg C")
##D fit
##D 
##D findpars(fit)
##D 
## End(Not run)



