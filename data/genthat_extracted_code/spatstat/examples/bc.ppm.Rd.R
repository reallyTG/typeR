library(spatstat)


### Name: bc.ppm
### Title: Bias Correction for Fitted Model
### Aliases: bc bc.ppm
### Keywords: spatial models math optimize

### ** Examples

  fit <- ppm(cells ~ x, Strauss(0.07))
  coef(fit)
  if(!interactive()) {
    bc(fit, nfine=64)
  } else {
    bc(fit)
  }



