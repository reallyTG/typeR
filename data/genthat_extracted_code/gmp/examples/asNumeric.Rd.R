library(gmp)


### Name: asNumeric
### Title: Coerce to 'numeric', not Loosing Dimensions
### Aliases: asNumeric asNumeric-methods asNumeric,ANY-method
###   asNumeric,bigq-method asNumeric,bigz-method
### Keywords: arith methods

### ** Examples

m <- matrix(1:6, 2,3)
stopifnot(identical(m, asNumeric(m)))# remains matrix

(M <- as.bigz(m) / 5) ##-> "bigq" matrix
asNumeric(M) # numeric matrix
stopifnot(all.equal(asNumeric(M), m/5))



