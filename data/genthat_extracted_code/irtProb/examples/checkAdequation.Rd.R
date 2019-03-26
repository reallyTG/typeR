library(irtProb)


### Name: checkAdequation
### Title: Function to Check the Adequation of the Second Derivatives
### Aliases: checkAdequation
### Keywords: distribution

### ** Examples

## Complete adequation of the matrix
## ..........................................................
 x <- matrix(c(4.867054, 16.66902, 16.669023, 107.36390), ncol=2)
 checkAdequation(x)
 all(checkAdequation(x))
 eigen(x)$values
 det(x)
 diag(x)
## ..........................................................

## Not positiveDefinite matrix
## ..........................................................
 x <- matrix(1:4, ncol=2)
 checkAdequation(x)
 all(checkAdequation(x))
 eigen(x)$values
 det(x)
 diag(x)
## ..........................................................

## More problems
## ..........................................................
 x <- matrix(c("Inf",2,5,10), ncol=2)
 checkAdequation(x)
 all(checkAdequation(x))
 det(x)
 diag(x)
# eigen(x)$values
 x <- matrix(c("NaN",2,5,10), ncol=2)
 checkAdequation(x)
 all(checkAdequation(x))
 det(x)
 diag(x)
# eigen(x)$values
## ..........................................................



