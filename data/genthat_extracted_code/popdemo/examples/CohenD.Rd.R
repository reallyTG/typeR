library(popdemo)


### Name: CohenD
### Title: Calculate Cohen's cumulative distance
### Aliases: CohenD

### ** Examples

  # Create a 3x3 PPM
  ( A <- matrix(c(0,1,2,0.5,0.1,0,0,0.6,0.6), byrow=TRUE, ncol=3) )

  # Create an initial stage structure
  ( initial <- c(1,3,2) )

  # Calculate Cohen cumulative distance
  CohenD(A, vector=initial)




