library(OpenMx)


### Name: omxCheckCloseEnough
### Title: Approximate Equality Testing Function
### Aliases: omxCheckCloseEnough

### ** Examples

omxCheckCloseEnough(c(1, 2, 3), c(1.1, 1.9 ,3.0), epsilon = 0.5)
omxCheckCloseEnough(matrix(3, 3, 3), matrix(4, 3, 3), epsilon = 2)
# Throws an error
try(omxCheckCloseEnough(c(1, 2, 3), c(1.1, 1.9 ,3.0), epsilon = 0.01))



