library(spam)


### Name: isSymmetric
### Title: Test if a spam matrix is Symmetric
### Aliases: isSymmetric.spam isSymmetric,spam-method
### Keywords: array

### ** Examples

obj <- diag.spam(2)
isSymmetric(obj)

obj[1,2] <- .Machine$double.eps
isSymmetric(obj)
all.equal(obj, t(obj))



