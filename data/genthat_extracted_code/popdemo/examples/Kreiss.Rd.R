library(popdemo)


### Name: Kreiss
### Title: Calculate Kreiss bounds
### Aliases: Kreiss

### ** Examples

  # Create a 3x3 PPM
  ( A <- matrix(c(0,1,2,0.5,0.1,0,0,0.6,0.6), byrow=TRUE, ncol=3) )

  # Calculate the upper Kreiss bound of A
  Kreiss(A, bound="upper")

  # Calculate the lower Kreiss bound of A
  Kreiss(A, bound="lower")

  # Calculate the upper Kreiss bound of A and return 
  # the value of r at which the function is maximised
  Kreiss(A, bound="upper", return.r=TRUE)




