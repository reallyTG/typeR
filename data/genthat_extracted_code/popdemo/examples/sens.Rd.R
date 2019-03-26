library(popdemo)


### Name: sens
### Title: Calculate sensitivity matrix
### Aliases: sens

### ** Examples

  # Create a 3x3 PPM
  ( A <- matrix(c(0,1,2,0.5,0.1,0,0,0.6,0.6), byrow=TRUE, ncol=3) )

  # Calculate sensitivities of dominant eigenvalue
  sens(A)
  # Calculate sensitivities of first subdominant eigenvalue,
  # only for observed transitions
  sens(A, eval=2, all=FALSE) 




