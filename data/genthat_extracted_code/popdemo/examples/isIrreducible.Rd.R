library(popdemo)


### Name: isIrreducible
### Title: Determine reducibility of a matrix
### Aliases: isIrreducible

### ** Examples

  # Create a 3x3 irreducible PPM
  ( A <- matrix(c(0,1,2,0.5,0.1,0,0,0.6,0.6), byrow=TRUE, ncol=3) )

  # Diagnose reducibility
  isIrreducible(A)

  # Create a 3x3 reducible PPM
  B<-A; B[3,2] <- 0; B

  # Diagnose reducibility
  isIrreducible(B)




