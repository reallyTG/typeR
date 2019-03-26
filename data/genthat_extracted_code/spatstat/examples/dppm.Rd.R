library(spatstat)


### Name: dppm
### Title: Fit Determinantal Point Process Model
### Aliases: dppm
### Keywords: spatial models

### ** Examples

  jpines <- residualspaper$Fig1
  ## Don't show: 
     # smaller dataset for testing
    jpines <- jpines[c(TRUE,FALSE)]
  
## End(Don't show)

  dppm(jpines ~ 1, dppGauss)

  dppm(jpines ~ 1, dppGauss, method="c")
  dppm(jpines ~ 1, dppGauss, method="p")

  # Fixing the intensity to lambda=2 rather than the Poisson MLE 2.04:
  dppm(jpines ~ 1, dppGauss(lambda=2))

  if(interactive()) {
   # The following is quite slow (using K-function)
   dppm(jpines ~ x, dppMatern)
  }

   # much faster using pair correlation function
  dppm(jpines ~ x, dppMatern, statistic="pcf", statargs=list(stoyan=0.2))

  # Fixing the Matern shape parameter to nu=2 rather than estimating it:
  dppm(jpines ~ x, dppMatern(nu=2))



