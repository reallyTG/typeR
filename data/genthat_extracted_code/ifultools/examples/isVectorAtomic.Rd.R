library(ifultools)


### Name: isVectorAtomic
### Title: Tests whether an object is a vector or not
### Aliases: isVectorAtomic
### Keywords: utilities

### ** Examples

## cases where isVectorAtomic returns TRUE 
z <- 1:3;names(z) <- letters[1:3]
isVectorAtomic(z)
isVectorAtomic(matrix(1:3, nrow=1))
isVectorAtomic(matrix(1:3, ncol=1))
isVectorAtomic(1:5)
isVectorAtomic(letters)

## cases where isVectorAtomic returns FALSE 
isVectorAtomic(list(1:3))
isVectorAtomic(data.frame(1:3,2:4))
isVectorAtomic(matrix(1:12, nrow=4))



