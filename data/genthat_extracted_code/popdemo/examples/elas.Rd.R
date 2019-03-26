library(popdemo)


### Name: elas
### Title: Calculate elasticity matrix
### Aliases: elas

### ** Examples

  # Create a 3x3 PPM
  ( A <- matrix(c(0,1,2,0.5,0.1,0,0,0.6,0.6), byrow=TRUE, ncol=3) )

  # Calculate sensitivities of dominant eigenvalue
  elas(A)
  # Calculate sensitivities of first subdominant eigenvalue,
  # only for observed transitions
  elas(A, eval=2)




