library(spatstat.local)


### Name: methods.locppm
### Title: Methods for Local Gibbs Models
### Aliases: methods.locppm as.interact.locppm as.ppm.locppm coef.locppm
###   confint.locppm is.poisson.locppm print.locppm
### Keywords: spatial methods

### ** Examples

   fit <- locppm(swedishpines, ~1, sigma=9, nd=20,
                 vcalc="full", locations="coarse")
   fit
   is.poisson(fit)
   coef(fit)
   coef(fit, which="homogeneous")
   confint(fit)
   confint(fit, which="homogeneous")
   as.ppm(fit)
   as.interact(fit)



