library(spatstat)


### Name: simulate.mppm
### Title: Simulate a Point Process Model Fitted to Several Point Patterns
### Aliases: simulate.mppm
### Keywords: spatial models

### ** Examples

  H <- hyperframe(Bugs=waterstriders)
  fit <- mppm(Bugs ~ id, H)
  y <- simulate(fit, nsim=2)
  y
  plot(y[1,,drop=TRUE], main="Simulations for Waterstriders pattern 1")
  plot(y[,1,drop=TRUE], main="Simulation 1 for each Waterstriders pattern")



