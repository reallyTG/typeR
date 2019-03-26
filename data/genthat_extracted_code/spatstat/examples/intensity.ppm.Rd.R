library(spatstat)


### Name: intensity.ppm
### Title: Intensity of Fitted Point Process Model
### Aliases: intensity.ppm
### Keywords: spatial models

### ** Examples

  fitP <- ppm(swedishpines ~ 1)
  intensity(fitP)
  fitS <- ppm(swedishpines ~ 1, Strauss(9))
  intensity(fitS)
  fitSx <- ppm(swedishpines ~ x, Strauss(9))
  lamSx <- intensity(fitSx)
  fitG <- ppm(swedishpines ~ 1, Geyer(9, 1))
  lamG <- intensity(fitG)
  fitA <- ppm(swedishpines ~ 1, AreaInter(7))
  lamA <- intensity(fitA)



