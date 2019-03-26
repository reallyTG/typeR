library(popdemo)


### Name: tfa_lambda
### Title: Transfer function analysis
### Aliases: tfa_lambda

### ** Examples

  # Create a 3x3 matrix
  ( A <- matrix(c(0,1,2,0.5,0.1,0,0,0.6,0.6), byrow=TRUE, ncol=3) )

  # Calculate the transfer function of A[3,2] given a range of lambda
  evals <- eigen(A)$values
  lmax <- which.max(Re(evals))
  lambda <- Re(evals[lmax])
  lambdarange <- seq(lambda-0.1, lambda+0.1, 0.01)
  ( transfer <- tfa_lambda(A, d=c(0,0,1), e=c(0,1,0), lambdarange=lambdarange) )

  # Plot the transfer function using the S3 method
  plot(transfer)

  # Calculate the transfer function of perturbation to A[3,2] and A[3,3]
  # with perturbation to A[3,2] half that of A[3,3], given a range of 
  # perturbation values
  p<-seq(-0.6,0.4,0.01)
  ( transfer2 <- tfa_lambda(A, d=c(0,0,1), e=c(0,0.5,1), prange=p) )

  # Plot p and lambda without using the S3 method
  plot(transfer$lambda~transfer$p, type="l", xlab="p", ylab=expression(lambda))




