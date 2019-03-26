library(gtools)


### Name: logit
### Title: Generalized logit and inverse logit function
### Aliases: logit inv.logit
### Keywords: math

### ** Examples


  x <- seq(0,10, by=0.25)
  xt <- logit(x, min=0, max=10)
  cbind(x,xt)

  y <- inv.logit(xt, min=0, max=10)
  cbind(x,xt,y)  




