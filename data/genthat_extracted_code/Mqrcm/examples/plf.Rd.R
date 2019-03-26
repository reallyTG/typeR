library(Mqrcm)


### Name: plf
### Title: Basis of a Piecewise Linear Function
### Aliases: plf
### Keywords: array

### ** Examples

  p <- seq(0,1, 0.1)

  a1 <- plf(p, knots = NULL) # returns p

  a2 <- plf(p, knots = c(0.2,0.7))
  plot(p, 3 + 1*a2[,1] - 1*a2[,2] + 2*a2[,3], type = "l") 
    # intercept = 3; slopes = (1,-1,2)



