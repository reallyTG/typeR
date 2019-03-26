library(spatstat)


### Name: rThomas
### Title: Simulate Thomas Process
### Aliases: rThomas
### Keywords: spatial datagen

### ** Examples

  #homogeneous
  X <- rThomas(10, 0.2, 5)
  #inhomogeneous
  Z <- as.im(function(x,y){ 5 * exp(2 * x - 1) }, owin())
  Y <- rThomas(10, 0.2, Z)



