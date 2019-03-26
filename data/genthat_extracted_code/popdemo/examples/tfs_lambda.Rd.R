library(popdemo)


### Name: tfs_lambda
### Title: Calculate sensitivity using transfer functions
### Aliases: tfs_lambda tfsm_lambda

### ** Examples

  # Create a 3x3 matrix
  ( A <- matrix(c(0,1,2,0.5,0.1,0,0,0.6,0.6), byrow=TRUE, ncol=3) )

  # Calculate the sensitivity matrix
  tfsm_lambda(A)

  # Calculate the sensitivity of simultaneous perturbation to 
  # A[1,2] and A[1,3]
  tfs_lambda(A, d=c(1,0,0), e=c(0,1,1))

  # Calculate the sensitivity of simultaneous perturbation to 
  # A[1,2] and A[1,3] and return and plot the fitting process
  tfs_lambda(A, d=c(1,0,0), e=c(0,1,1),
             return.fit=TRUE, plot.fit=TRUE)




