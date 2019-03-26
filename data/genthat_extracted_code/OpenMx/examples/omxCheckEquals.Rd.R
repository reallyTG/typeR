library(OpenMx)


### Name: omxCheckEquals
### Title: Equality Testing Function
### Aliases: omxCheckEquals

### ** Examples


omxCheckEquals(c(1, 2, 3), c(1, 2, 3))

omxCheckEquals(FALSE, FALSE)

# Throws an error
try(omxCheckEquals(c(1, 2, 3), c(2, 1, 3)))




