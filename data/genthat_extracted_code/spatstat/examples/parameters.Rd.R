library(spatstat)


### Name: parameters
### Title: Extract Model Parameters in Understandable Form
### Aliases: parameters parameters.dppm parameters.kppm parameters.ppm
###   parameters.profilepl parameters.interact parameters.fii
### Keywords: spatial models

### ** Examples

  fit1 <- ppm(cells ~ x, Strauss(0.1))
  parameters(fit1)
  fit2 <- kppm(redwood ~ x, "Thomas")
  parameters(fit2)



