library(spatstat)


### Name: linearKinhom
### Title: Inhomogeneous Linear K Function
### Aliases: linearKinhom
### Keywords: spatial nonparametric

### ** Examples

  data(simplenet)
  X <- rpoislpp(5, simplenet)
  fit <- lppm(X ~x)
  K <- linearKinhom(X, lambda=fit)
  plot(K)



