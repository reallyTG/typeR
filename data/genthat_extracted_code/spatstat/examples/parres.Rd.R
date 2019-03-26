library(spatstat)


### Name: parres
### Title: Partial Residuals for Point Process Model
### Aliases: parres
### Keywords: spatial models

### ** Examples

  X <-  rpoispp(function(x,y){exp(3+x+2*x^2)})
  model <- ppm(X ~x+y)
  tra <- parres(model, "x")
  plot(tra)
  tra
  plot(parres(model, "x", subregion=square(0.5)))
  model2 <- ppm(X ~x+I(x^2)+y)
  plot(parres(model2, "x"))
  Z <- setcov(owin())
  plot(parres(model2, Z))



