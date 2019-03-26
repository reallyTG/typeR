library(popdemo)


### Name: projectionD
### Title: Calculate projection distance
### Aliases: projectionD

### ** Examples

  # Create a 3x3 PPM
  ( A <- matrix(c(0,1,2,0.5,0.1,0,0,0.6,0.6), byrow=TRUE, ncol=3) )

  # Create an initial stage structure
  ( initial <- c(1,3,2) )

  # Calculate projection distance
  projectionD(A, vector=initial)




