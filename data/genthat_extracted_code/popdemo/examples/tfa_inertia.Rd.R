library(popdemo)


### Name: tfa_inertia
### Title: Transfer function Analysis
### Aliases: tfa_inertia

### ** Examples

  # Create a 3x3 matrix
  ( A <- matrix(c(0,1,2,0.5,0.1,0,0,0.6,0.6), byrow=TRUE, ncol=3) )

  # Create an initial stage structure
  ( initial <- c(1,3,2) )

  # Calculate the transfer function of upper bound on inertia 
  # given a perturbation to A[3,2]
  ( transfer<-tfa_inertia(A, d=c(0,0,1), e=c(0,1,0), bound="upper",
                          prange=seq(-0.6,0.4,0.01)) )

  # Plot the transfer function using the S3 method (defaults to p 
  # and inertia in this case)
  plot(transfer)

  # Plot inertia against lambda using the S3 method
  plot(transfer, xvar="lambda", yvar="inertia")

  # Calculate the transfer function of case-specific inertia 
  # given perturbation to A[3,2] and A[3,3] with perturbation 
  # to A[3,2] half that of A[3,3]
  ( transfer2<-tfa_inertia(A, d=c(0,0,1), e=c(0,0.5,1), vector=initial,
                           prange=seq(-0.6,0.4,0.01)) )

  # Plot inertia against p using the S3 method
  plot(transfer2)

  # Plot inertia against lambda without using the S3 method
  plot(transfer$inertia~transfer$lambda,type="l", 
       xlab=expression(lambda),ylab="inertia")




