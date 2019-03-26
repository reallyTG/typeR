library(popdemo)


### Name: tfam_lambda
### Title: Transfer function analysis
### Aliases: tfam_lambda

### ** Examples

  # Create a 3x3 matrix
  ( A <- matrix(c(0,1,2,0.5,0.1,0,0,0.6,0.6), byrow=TRUE, ncol=3) )

  # Calculate the matrix of transfer functions using default arguments
  ( tfmat<-tfam_lambda(A) )

  # Plot the result using the S3 method
  plot(tfmat)

  # Plot the transfer function of element [3,2] without using the S3 method
  par(mfrow=c(1,1))
  par(mar=c(5,4,4,2)+0.1)
  plot(tfmat$lambda[3,2,]~tfmat$p[3,2,],xlab="p",ylab="lambda",type="l")

  # Create a new matrix with fission of adults
  B <- A; B[2,3] <- 0.9; B

  # Calculate the matrix of transfer functions using chosen arguments
  # that give the exact structure of the new matrix
  # and perturb a minimum of half the value of an element and
  # a maximum of double the value of an element
  ( etype <- matrix(c(NA, "F", "F", "P", "P", "F", NA, "P", "P"), 
                  ncol=3, byrow=TRUE) )
  ( tfmat2 <- tfam_lambda(B, elementtype=etype, Flim=c(-0.5,2),
                      Plim=c(-0.5,2)) )

  # Plot the new matrix of transfer functions using the S3 method
  plot(tfmat2)
    



