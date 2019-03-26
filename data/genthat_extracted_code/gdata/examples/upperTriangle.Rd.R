library(gdata)


### Name: upperTriangle
### Title: Extract or replace the upper/lower triangular portion of a
###   matrix
### Aliases: upperTriangle upperTriangle<- lowerTriangle lowerTriangle<-
### Keywords: array

### ** Examples

  x <- matrix( 1:25, nrow=5, ncol=5)
  x
  upperTriangle(x)
  upperTriangle(x, diag=TRUE)
  upperTriangle(x, diag=TRUE, byrow=TRUE)


  lowerTriangle(x)
  lowerTriangle(x, diag=TRUE)
  lowerTriangle(x, diag=TRUE, byrow=TRUE)

  upperTriangle(x) <- NA
  x

  upperTriangle(x, diag=TRUE) <- 1:15
  x

  lowerTriangle(x) <- NA
  x

  lowerTriangle(x, diag=TRUE) <- 1:15
  x

  ## Copy lower triangle into upper triangle to make 
  ## the matrix (diagonally) symmetric
  x <- matrix(LETTERS[1:25], nrow=5, ncol=5, byrow=TRUE)
  x
  lowerTriangle(x) = upperTriangle(x, byrow=TRUE)
  x



