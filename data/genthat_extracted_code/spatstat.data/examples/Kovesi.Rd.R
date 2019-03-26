library(spatstat.data)


### Name: Kovesi
### Title: Colour Sequences with Uniform Perceptual Contrast
### Aliases: Kovesi
### Keywords: datasets

### ** Examples

  Kovesi
  LinearBMW <- Kovesi$values[[28]]
  if(require(spatstat)) {
  plot(colourmap(LinearBMW, range=c(0,1)))

  ## The following would be suitable for spatstat.options(image.colfun)
  BMWfun <- function(n) { interp.colours(LinearBMW, n) }
  }



