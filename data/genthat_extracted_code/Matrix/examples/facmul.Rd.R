library(Matrix)


### Name: facmul
### Title: Multiplication by Decomposition Factors
### Aliases: facmul facmul.default
### Keywords: array algebra

### ** Examples

library(Matrix)
x <- Matrix(rnorm(9), 3, 3)
## Not run: 
##D qrx <- qr(x)                      # QR factorization of x
##D y <- rnorm(3)
##D facmul( qr(x), factor = "Q", y)   # form Q y
## End(Not run)



