library(Rdistance)


### Name: F.gx.estim
### Title: Estimate g(0) or g(x)
### Aliases: F.gx.estim
### Keywords: model

### ** Examples

## Not run: 
##D   # NOTE, this example is out of date as of version 2.0.x
##D   # Non-double observer example
##D   set.seed(555574)
##D   x <- rnorm(1000) * 100
##D   x <- x[ 0 < x & x < 100 ]
##D   un.dfunc <- dfuncEstim( x, likelihood="uniform", w.hi = 100)    
##D   F.gx.estim(un.dfunc)
##D   gam.dfunc <- dfuncEstim( x, likelihood="Gamma", w.hi = 100)    
##D   F.gx.estim(gam.dfunc)
##D   
##D   # Double observer example
##D   dbl.obs <- data.frame(obsby.1=rbinom(50,1,0.8), obsby.2=rbinom(50,1,0.7))
##D   F.gx.estim(un.dfunc, x.scl=0, g.x.scl=dbl.obs, observer="both" )
##D   # a warning about x.scl < $w.lo is issued.
##D   F.gx.estim(un.dfunc, x.scl="max", g.x.scl=dbl.obs, observer="both" )
##D   F.gx.estim(un.dfunc, x.scl="max", g.x.scl=dbl.obs, observer=1 )
##D   
## End(Not run)



