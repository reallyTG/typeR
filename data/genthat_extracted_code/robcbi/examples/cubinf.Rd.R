library(robcbi)


### Name: cubinf
### Title: Conditionally unbiased bounded influence estimates of discrete
###   Generalized Linear Models
### Aliases: cubinf
### Keywords: stats robust

### ** Examples

  library(robcbi)
  y <- c(5,10,15,20,30,40,60,80,100)
  x <- matrix(
	c(0,1,0,0,1,0,0,1,0,0,0,1,0,0,1,0,0,1,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,1,1,1),
    nrow=9,byrow=FALSE)
  z <- cubinf(x,y, family=poisson, control=list(ufact=3.2), intercept=TRUE)
  z$iter
  z$coeff
  z <- cubinf(x,y, family=poisson, control=list(ufact=30), intercept=TRUE)
  z$iter
  z$coeff



