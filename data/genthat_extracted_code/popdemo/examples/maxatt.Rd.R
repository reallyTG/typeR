library(popdemo)


### Name: maxatt
### Title: Calculate maximal attenuation
### Aliases: maxatt

### ** Examples

  # Create a 3x3 PPM
  ( A <- matrix(c(0,1,2,0.5,0.1,0,0,0.6,0.6), byrow=TRUE, ncol=3) )

  # Create an initial stage structure
  ( initial <- c(3,1,1) )

  # Calculate the bound on maximal attenuation of A
  maxatt(A)

  # Calculate the bound on maximal attenuation of A and 
  # return the stage that achieves it
  maxatt(A, return.stage=TRUE)

  # Calculate case-specific maximal attenuation of A
  # and initial
  maxatt(A, vector=initial)

  # Calculate case-specific maximal attenuation of A
  # and initial and return realised population size and the 
  # time at which it is achieved
  maxatt(A, vector=initial, return.N=TRUE, return.t=TRUE)




