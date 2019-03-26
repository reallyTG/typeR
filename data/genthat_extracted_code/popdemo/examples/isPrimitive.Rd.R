library(popdemo)


### Name: isPrimitive
### Title: Determine primitivity of a matrix
### Aliases: isPrimitive

### ** Examples

  # Create a 3x3 primitive PPM
  ( A <- matrix(c(0,1,2,0.5,0,0,0,0.6,0), byrow=TRUE, ncol=3) )

  # Diagnose primitivity
  isPrimitive(A)

  # Create a 3x3 imprimitive PPM
  B<-A; B[1,2] <- 0; B

  # Diagnose primitivity
  isPrimitive(B)




