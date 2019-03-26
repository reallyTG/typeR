library(spatstat)


### Name: Kmodel.kppm
### Title: K Function or Pair Correlation Function of Cluster Model or Cox
###   model
### Aliases: Kmodel.kppm pcfmodel.kppm
### Keywords: spatial models

### ** Examples

  data(redwood)
  fit <- kppm(redwood, ~x, "MatClust")
  K <- Kmodel(fit)
  K(c(0.1, 0.2))
  curve(K(x), from=0, to=0.25)



