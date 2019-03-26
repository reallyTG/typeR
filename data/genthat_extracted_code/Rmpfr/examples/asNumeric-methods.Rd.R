library(Rmpfr)


### Name: asNumeric-methods
### Title: Methods for 'asNumeric(<mpfr>)'
### Aliases: asNumeric-methods asNumeric,mpfr-method
###   asNumeric,mpfrArray-method
### Keywords: methods

### ** Examples

x <- (0:7)/8 # (exact)
X <- mpfr(x, 99)
stopifnot(identical(asNumeric(x), x),
	  identical(asNumeric(X), x))

m <- matrix(1:6, 3,2)
(M <- mpfr(m, 99) / 5) ##-> "mpfrMatrix"
asNumeric(M) # numeric matrix
stopifnot(all.equal(asNumeric(M), m/5),
          identical(asNumeric(m), m))# remains matrix



