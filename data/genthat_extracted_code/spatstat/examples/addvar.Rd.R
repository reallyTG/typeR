library(spatstat)


### Name: addvar
### Title: Added Variable Plot for Point Process Model
### Aliases: addvar
### Keywords: spatial models

### ** Examples

  X <-  rpoispp(function(x,y){exp(3+3*x)})
  model <- ppm(X, ~y)
  adv <- addvar(model, "x")
  plot(adv)
  adv <- addvar(model, "x", subregion=square(0.5))



