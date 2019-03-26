library(fingerprint)


### Name: fingerprint-class
### Title: Class "fingerpint"
### Aliases: fingerprint-class euc.vector,fingerprint-method
###   fold,fingerprint-method random.fingerprint,numeric,numeric-method
### Keywords: classes logic

### ** Examples

## make fingerprints
x <- new("fingerprint", nbit=128, bits=sample(1:128, 100))
y <- x
distance(x,y) # should be 1
x <- new("fingerprint", nbit=128, bits=sample(1:128, 100))
distance(x,y)
folded <- fold(x)

## binary operations on fingerprints
x <- new("fingerprint", nbit=8, bits=c(1,2,3,6,8))
y <- new("fingerprint", nbit=8, bits=c(1,2,4,5,7,8))
x & y
x | y
!x



