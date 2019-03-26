library(popdemo)


### Name: R2Matlab
### Title: Convert matrices into Matlab style strings
### Aliases: R2Matlab

### ** Examples

  # Create a 3x3 PPM
  ( A <- matrix(c(0,1,2,0.5,0.1,0,0,0.6,0.6), byrow=TRUE, ncol=3) )

  # Code the matrix in a Matlab style
  R2Matlab(A)

  # Print without quotes
  R2Matlab(A, noquote=TRUE)




