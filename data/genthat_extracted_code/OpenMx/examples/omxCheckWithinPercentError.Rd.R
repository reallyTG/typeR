library(OpenMx)


### Name: omxCheckWithinPercentError
### Title: Approximate Percent Equality Testing Function
### Aliases: omxCheckWithinPercentError

### ** Examples


omxCheckWithinPercentError(c(1, 2, 3), c(1.1, 1.9 ,3.0), percent = 50)

omxCheckWithinPercentError(matrix(3, 3, 3), matrix(4, 3, 3), percent = 150)

# Throws an error
try(omxCheckWithinPercentError(c(1, 2, 3), c(1.1, 1.9 ,3.0), percent = 0.01))




