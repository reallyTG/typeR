library(popdemo)


### Name: tfs_inertia
### Title: Calculate sensitivity of inertia using transfer functions
### Aliases: tfs_inertia tfsm_inertia

### ** Examples

  # Create a 3x3 matrix
  ( A <- matrix(c(0,1,2,0.5,0.1,0,0,0.6,0.6), byrow=TRUE, ncol=3) )

  # Create an initial stage structure    
  ( initial <- c(1,3,2) )

  # Calculate the sensitivity matrix for the upper bound on inertia
  tfsm_inertia(A, bound="upper",tolerance=1e-7)

  # Calculate the sensitivity of simultaneous perturbation to 
  # A[1,3] and A[2,3] for the lower bound on inertia
  tfs_inertia(A, d=c(1,0,0), e=c(0,1,1), bound="lower")

  # Calculate the sensitivity of simultaneous perturbation to 
  # A[1,3] and A[2,3] for specified initial stage structure
  # and return and plot the fitting process
  tfs_inertia(A, d=c(1,0,0), e=c(0,1,1), vector=initial,tolerance=1e-7,
              return.fit=TRUE,plot.fit=TRUE)




