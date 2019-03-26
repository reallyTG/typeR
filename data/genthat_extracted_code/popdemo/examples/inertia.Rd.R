library(popdemo)


### Name: inertia
### Title: Calculate population inertia
### Aliases: inertia

### ** Examples

  # Create a 3x3 PPM
  ( A <- matrix(c(0,1,2,0.5,0.1,0,0,0.6,0.6), byrow=TRUE, ncol=3) )

  # Create an initial stage structure
  ( initial <- c(1,3,2) )

  # Calculate the upper bound on inertia of A
  inertia(A,bound="upper")

  # Calculate the lower bound on inertia of A
  inertia(A,bound="lower")

  # Calculate case-specific inertia of A and initial
  inertia(A, vector=initial)

  # Calculate case-specific inertia of A and initial and 
  # return realised population size at t=25
  inertia(A, vector=initial, return.N=TRUE, t=25)




