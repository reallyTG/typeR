library(spatstat)


### Name: valid.ppm
### Title: Check Whether Point Process Model is Valid
### Aliases: valid.ppm
### Keywords: spatial models

### ** Examples

   fit1 <- ppm(cells, ~1, Strauss(0.1))
   valid(fit1)
   fit2 <- ppm(redwood, ~1, Strauss(0.1))
   valid(fit2)



