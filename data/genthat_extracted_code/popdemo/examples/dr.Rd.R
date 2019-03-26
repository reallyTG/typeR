library(popdemo)


### Name: dr
### Title: Calculate damping ratio
### Aliases: dr

### ** Examples

  # Create a 3x3 PPM
  A <- matrix(c(0,1,2,0.5,0.1,0,0,0.6,0.6), byrow=TRUE, ncol=3)

  # Calculate damping ratio
  dr(A)

  # Calculate damping ratio and time to convergence using a 
  # multiple of 10
  dr(A, return.time=TRUE, x=10)




