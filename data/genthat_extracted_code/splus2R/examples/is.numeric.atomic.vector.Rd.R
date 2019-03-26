library(splus2R)


### Name: isNumericAtomicVector
### Title: Tests whether an object is a vector or not
### Aliases: isNumericAtomicVector
### Keywords: utilities

### ** Examples

## cases where isNumericAtomicVector returns 
## TRUE 
z <- 1:3;names(z) <- letters[1:3]
isNumericAtomicVector(z)
isNumericAtomicVector(matrix(1:3, nrow=1))
isNumericAtomicVector(matrix(1:3, ncol=1))
isNumericAtomicVector(1:5)
isNumericAtomicVector(letters)

## cases where isNumericAtomicVector returns 
## FALSE 
isNumericAtomicVector(list(1:3))
isNumericAtomicVector(data.frame(1:3,2:4))
isNumericAtomicVector(matrix(1:12, nrow=4))



