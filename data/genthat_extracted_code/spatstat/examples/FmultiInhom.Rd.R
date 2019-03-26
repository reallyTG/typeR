library(spatstat)


### Name: FmultiInhom
### Title: Inhomogeneous Marked F-Function
### Aliases: FmultiInhom
### Keywords: spatial nonparametric

### ** Examples

  X <- amacrine
  J <- (marks(X) == "off")
  mod <- ppm(X ~ marks * x)
  lam <- fitted(mod, dataonly=TRUE)
  lmin <- min(predict(mod)[["off"]]) * 0.9
  plot(FmultiInhom(X, J, lambda=lam, lambdamin=lmin))



