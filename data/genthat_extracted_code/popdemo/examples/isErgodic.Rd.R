library(popdemo)


### Name: isErgodic
### Title: Determine ergodicity of a matrix
### Aliases: isErgodic

### ** Examples

  # Create a 3x3 ergodic PPM
  ( A <- matrix(c(0,0,2,0.5,0.1,0,0,0.6,0.6), byrow=TRUE, ncol=3) )

  # Diagnose ergodicity
  isErgodic(A)

  # Create a 3x3 nonergodic PPM
  B<-A; B[3,2] <- 0; B

  # Diagnose ergodicity and return left eigenvector
  isErgodic(B, return.eigvec=TRUE)




