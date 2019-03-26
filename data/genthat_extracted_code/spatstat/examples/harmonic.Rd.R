library(spatstat)


### Name: harmonic
### Title: Basis for Harmonic Functions
### Aliases: harmonic
### Keywords: spatial models

### ** Examples

   # inhomogeneous point pattern
   X <- unmark(longleaf)
   ## Don't show: 
     # smaller dataset
     X <- X[seq(1,npoints(X), by=50)]
   
## End(Don't show)

   # fit Poisson point process with log-cubic intensity
   fit.3 <- ppm(X ~ polynom(x,y,3), Poisson())

   # fit Poisson process with log-cubic-harmonic intensity
   fit.h <- ppm(X ~ harmonic(x,y,3), Poisson())

   # Likelihood ratio test
   lrts <- 2 * (logLik(fit.3) - logLik(fit.h))
   df <- with(coords(X),
              ncol(polynom(x,y,3)) - ncol(harmonic(x,y,3)))
   pval <- 1 - pchisq(lrts, df=df)



