library(DescTools)


### Name: Logit
### Title: Generalized Logit and Inverse Logit Function
### Aliases: Logit LogitInv
### Keywords: math

### ** Examples


  x <- seq(0,10, by=0.25)
  xt <- Logit(x, min=0, max=10)
  cbind(x,xt)

  y <- LogitInv(xt, min=0, max=10)
  cbind(x, xt, y)




