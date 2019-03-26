library(extRemes)


### Name: strip
### Title: Strip Fitted EVD Object of Everything but the Parameter
###   Estimates
### Aliases: strip strip.fevd
### Keywords: manip attribute

### ** Examples


z <- revd(100, loc=20, scale=0.5, shape=-0.2)
fit <- fevd(z)
fit

strip( fit )
strip( fit, use.names = FALSE )

# Compare with ...
distill( fit )
distill( fit, cov = FALSE )

## Not run: 
##D data( "Fort" )
##D fit <- fevd(Prec, Fort, threshold=0.395,
##D     scale.fun=~sin(2 * pi * (year - 1900)/365.25) + 
##D         cos(2 * pi * (year - 1900)/365.25),
##D     type="PP", method="Bayesian", iter=1999, use.phi=TRUE, verbose=TRUE)
##D 
##D fit
##D 
##D strip( fit )
##D strip( fit, burn.in = 700 )
##D strip( fit, FUN = "postmode" )
##D 
## End(Not run)



