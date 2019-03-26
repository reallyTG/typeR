library(popdemo)


### Name: plot.tfa
### Title: Plot transfer function
### Aliases: plot.tfa

### ** Examples

  # Create a 3x3 matrix
  ( A <- matrix(c(0,1,2,0.5,0.1,0,0,0.6,0.6), byrow=TRUE, ncol=3) )

  # Calculate the transfer function of A[3,2] given a range of lambda
  evals <- eigen(A)$values
  lmax <- which.max(Re(evals))
  lambda <- Re(evals[lmax])
  lambdarange <- seq(lambda-0.1, lambda+0.1, 0.01)
  ( transfer <- tfa_lambda(A, d=c(0,0,1), e=c(0,1,0), lambdarange=lambdarange) )

  # Plot the transfer function
  plot(transfer)

  # Create an initial stage structure
  ( initial <- c(1,3,2) )

  # Calculate the transfer function of upper bound on inertia 
  # given a perturbation to A[3,2]
  ( transfer<-tfa_inertia(A, d=c(0,0,1), e=c(0,1,0), bound="upper",
                          prange=seq(-0.6,0.4,0.01)) )

  # Plot the transfer function (defaults to inertia ~ p)
  plot(transfer)

  # Plot inertia against lambda
  plot(transfer, xvar="lambda", yvar="inertia")




