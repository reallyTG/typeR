library(popdemo)


### Name: plot.tfam
### Title: Plot transfer function
### Aliases: plot.tfam

### ** Examples

  # Create a 3x3 matrix
  ( A <- matrix(c(0,1,2,0.5,0.1,0,0,0.6,0.6), byrow=TRUE, ncol=3) )

  # Calculate the matrix of transfer functions using default arguments
  ( tfmat<-tfam_lambda(A) )

  # Plot the matrix of transfer functions
  plot(tfmat)

  # Create an initial stage structure
  ( initial <- c(1,3,2) )

  # Calculate the matrix of transfer functions for inertia and 
  # specified initial stage structure using default arguments
  ( tfmat2<-tfam_inertia(A,vector=initial) )

  # Plot the result (defaults to inertia ~ p)
  plot(tfmat2)

  # Plot inertia ~ lambda
  plot(tfmat2, xvar="lambda", yvar="inertia")




