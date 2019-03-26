library(spatstat)


### Name: GmultiInhom
### Title: Inhomogeneous Marked G-Function
### Aliases: GmultiInhom
### Keywords: spatial nonparametric

### ** Examples

  X <- amacrine
  I <- (marks(X) == "on")
  J <- (marks(X) == "off")
  mod <- ppm(X ~ marks * x)
  lam <- fitted(mod, dataonly=TRUE)
  lmin <- min(predict(mod)[["off"]]) * 0.9
  plot(GmultiInhom(X, I, J, lambda=lam, lambdamin=lmin))



