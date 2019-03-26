library(spatstat)


### Name: lppm
### Title: Fit Point Process Model to Point Pattern on Linear Network
### Aliases: lppm lppm.formula lppm.lpp
### Keywords: spatial models

### ** Examples

  X <- runiflpp(15, simplenet)
  lppm(X ~1)
  lppm(X ~x)
  marks(X) <- factor(rep(letters[1:3], 5))
  lppm(X ~ marks)
  lppm(X ~ marks * x)



