library(popdemo)


### Name: tfam_inertia
### Title: Transfer function Analysis
### Aliases: tfam_inertia

### ** Examples

  # Create a 3x3 matrix
  ( A <- matrix(c(0,1,2,0.5,0.1,0,0,0.6,0.6), byrow=TRUE, ncol=3) )

  # Create an initial stage structure
  ( initial <- c(1,3,2))

  # Calculate the matrix of transfer functions for the upper bound on
  # inertia, using default arguments
  ( tfmat<-tfam_inertia(A,bound="upper") )

  # Plot the transfer function using the S3 method (defaults to p 
  # and inertia in this case)
  plot(tfmat)

  # Plot inertia against lambda using the S3 method
  plot(tfmat, xvar="lambda", yvar="inertia")
    
  # Plot the transfer function of element [3,2] without the S3 method
  par(mfrow=c(1,1))
  par(mar=c(5,4,4,2)+0.1)
  plot(tfmat$inertia[3,2,]~tfmat$p[3,2,],xlab="p",ylab="lambda",type="l")

  # Create a new matrix with fission of adults
  B <- A; B[2,3] <- 0.9; B

  # Calculate the matrix of transfer functions for specified
  # initial stage structure, using chosen arguments
  # that give the exact structure of the new matrix
  # and perturb a minimum of half the value of an element and
  # a maximum of double the value of an element
  ( etype <- matrix(c(NA, "F", "F", "P", "P", "F", NA, "P", "P"), 
                    ncol=3, byrow=TRUE) )
  ( tfmat2 <- tfam_inertia(B, vector=initial, elementtype=etype, 
                                Flim=c(-0.5,2), Plim=c(-0.5,2)) )

  # Plot the new matrix of transfer functions using the S3 method
  plot(tfmat2)
    



