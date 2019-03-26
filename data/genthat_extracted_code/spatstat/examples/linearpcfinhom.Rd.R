library(spatstat)


### Name: linearpcfinhom
### Title: Inhomogeneous Linear Pair Correlation Function
### Aliases: linearpcfinhom
### Keywords: spatial nonparametric

### ** Examples

  data(simplenet)
  X <- rpoislpp(5, simplenet)
  fit <- lppm(X ~x)
  K <- linearpcfinhom(X, lambda=fit)
  plot(K)



