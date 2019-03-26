library(mgcv)


### Name: trind.generator
### Title: Generates index arrays for upper triangular storage
### Aliases: trind.generator

### ** Examples

library(mgcv)
A <- trind.generator(3)

# All permutations of c(1, 2, 3) point to the same index (5)
A$i3[1, 2, 3] 
A$i3[2, 1, 3]
A$i3[2, 3, 1]
A$i3[3, 1, 2]
A$i3[1, 3, 2]



