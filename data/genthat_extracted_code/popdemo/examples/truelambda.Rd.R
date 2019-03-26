library(popdemo)


### Name: truelambda
### Title: Calculate asymptotic growth
### Aliases: truelambda

### ** Examples

  # Create a 3x3 irreducible PPM
  ( A <- matrix(c(0,0,2,0.5,0.1,0,0,0.6,0.6), byrow=TRUE, ncol=3) )

  # Create an initial stage structure
  ( initial <- c(1,3,2) )

  # Calculate the true asymptotic growth of the stage-biased
  # projections of A
  truelambda(A)

  # Calculate the true asymptotic growth of the projection of
  # A and initial
  truelambda(A, vector=initial)

  # Create a 3x3 reducible, nonergodic PPM
  B<-A; B[3,2] <- 0; B

  # Calculate the true asymptotic growth of the 3 stage-biased
  # projections of B
  truelambda(B)




