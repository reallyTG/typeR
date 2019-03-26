library(OpenMx)


### Name: omxCheckIdentical
### Title: Exact Equality Testing Function
### Aliases: omxCheckIdentical

### ** Examples


omxCheckIdentical(c(1, 2, 3), c(1, 2, 3))

omxCheckIdentical(FALSE, FALSE)

# Throws an error
try(omxCheckIdentical(c(1, 2, 3), c(2, 1, 3)))




