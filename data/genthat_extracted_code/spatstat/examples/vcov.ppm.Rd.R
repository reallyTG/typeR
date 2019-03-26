library(spatstat)


### Name: vcov.ppm
### Title: Variance-Covariance Matrix for a Fitted Point Process Model
### Aliases: vcov.ppm
### Keywords: spatial methods models

### ** Examples

  X <- rpoispp(42)
  fit <- ppm(X, ~ x + y)
  vcov(fit)
  vcov(fit, what="Fish")

  # example of singular system
  m <- ppm(demopat ~polynom(x,y,2))
  ## Not run: 
##D     try(v <- vcov(m))
##D   
## End(Not run)
  # rescale x, y coordinates to range [0,1] x [0,1] approximately
  demopatScale <- rescale(demopat, 10000)
  m <- ppm(demopatScale ~ polynom(x,y,2))
  v <- vcov(m)

  # Gibbs example
  fitS <- ppm(swedishpines ~1, Strauss(9))
  coef(fitS)
  sqrt(diag(vcov(fitS)))



