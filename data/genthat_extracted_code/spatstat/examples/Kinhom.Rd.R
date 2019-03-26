library(spatstat)


### Name: Kinhom
### Title: Inhomogeneous K-function
### Aliases: Kinhom
### Keywords: spatial nonparametric

### ** Examples

  # inhomogeneous pattern of maples
  X <- unmark(split(lansing)$maple)
  ## Don't show: 
     sub <- sample(c(TRUE,FALSE), npoints(X), replace=TRUE, prob=c(0.1,0.9))
     X <- X[sub]
  
## End(Don't show)

  # (1) intensity function estimated by model-fitting
  # Fit spatial trend: polynomial in x and y coordinates
  fit <- ppm(X, ~ polynom(x,y,2), Poisson())
  # (a) predict intensity values at points themselves,
  #     obtaining a vector of lambda values
  lambda <- predict(fit, locations=X, type="trend")
  # inhomogeneous K function
  Ki <- Kinhom(X, lambda)
  plot(Ki)
  # (b) predict intensity at all locations,
  #     obtaining a pixel image
  lambda <- predict(fit, type="trend")
  Ki <- Kinhom(X, lambda)
  plot(Ki)

  # (2) intensity function estimated by heavy smoothing
  Ki <- Kinhom(X, sigma=0.1)
  plot(Ki)

  # (3) simulated data: known intensity function
  lamfun <- function(x,y) { 50 + 100 * x }
  # inhomogeneous Poisson process
  Y <- rpoispp(lamfun, 150, owin())
  # inhomogeneous K function
  Ki <- Kinhom(Y, lamfun)
  plot(Ki)

  # How to make simulation envelopes:
  #      Example shows method (2)
  ## Not run: 
##D   smo <- density.ppp(X, sigma=0.1)
##D   Ken <- envelope(X, Kinhom, nsim=99,
##D                   simulate=expression(rpoispp(smo)),
##D                   sigma=0.1, correction="trans")
##D   plot(Ken)
##D   
## End(Not run)



