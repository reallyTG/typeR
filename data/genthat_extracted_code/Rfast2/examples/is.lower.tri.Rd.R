library(Rfast2)


### Name:  Check if a matrix is Lower or Upper triangular 
### Title: Check if a matrix is Lower or Upper triangular
### Aliases: is.lower.tri is.upper.tri
### Keywords: Check if a matrix is Lower or Upper triangular

### ** Examples


x <- matrix(runif(10*10),10,10)

is.lower.tri(x)
is.lower.tri(x,TRUE)

## No test: 
is.upper.tri(x)
is.upper.tri(x,TRUE)
## End(No test)



