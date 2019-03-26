library(popdemo)


### Name: maxamp
### Title: Calculate maximal amplification
### Aliases: maxamp

### ** Examples

  # Create a 3x3 PPM
  ( A <- matrix(c(0,1,2,0.5,0.1,0,0,0.6,0.6), byrow=TRUE, ncol=3) )

  # Create an initial stage structure
  ( initial <- c(1,3,2) )

  # Calculate the bound on maximal amplification of A
  maxamp(A)

  # Calculate the bound on maximal amplification of A and 
  # return the stage that achieves it
  maxamp(A, return.stage=TRUE)

  # Calculate case-specific maximal amplification of A
  # and initial
  maxamp(A, vector=initial)

  # Calculate case-specific maximal amplification of A
  # and initial and return realised population size and the 
  # time at which it is achieved
  maxamp(A, vector=initial, return.N=TRUE, return.t=TRUE)




