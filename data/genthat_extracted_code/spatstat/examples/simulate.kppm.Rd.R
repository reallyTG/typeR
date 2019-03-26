library(spatstat)


### Name: simulate.kppm
### Title: Simulate a Fitted Cluster Point Process Model
### Aliases: simulate.kppm
### Keywords: spatial models

### ** Examples

  fit <- kppm(redwood ~1, "Thomas")
  simulate(fit, 2)
  fitx <- kppm(redwood ~x, "Thomas")
  simulate(fitx, 2)



