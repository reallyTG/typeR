library(spatstat)


### Name: Kmodel.ppm
### Title: K Function or Pair Correlation Function of Gibbs Point Process
###   model
### Aliases: Kmodel.ppm pcfmodel.ppm
### Keywords: spatial models

### ** Examples

  fit <- ppm(swedishpines, ~1, Strauss(8))
  p <- pcfmodel(fit)
  K <- Kmodel(fit)
  p(6)
  K(8)
  curve(K(x), from=0, to=15)



