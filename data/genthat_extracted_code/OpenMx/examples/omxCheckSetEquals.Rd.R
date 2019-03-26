library(OpenMx)


### Name: omxCheckSetEquals
### Title: Set Equality Testing Function
### Aliases: omxCheckSetEquals

### ** Examples


omxCheckSetEquals(c(1, 1, 2, 2, 3), c(3, 2, 1))

omxCheckSetEquals(matrix(1, 1, 1), matrix(1, 3, 3))

# Throws an error
try(omxCheckSetEquals(c(1, 2, 3, 4), c(2, 1, 3)))




