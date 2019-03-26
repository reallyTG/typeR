library(tricolore)


### Name: TernaryNearest
### Title: For Ternary Coordinates P Return the Nearest Coordinate in Set C
### Aliases: TernaryNearest
### Keywords: internal

### ** Examples

P <- prop.table(matrix(runif(9), ncol = 3), 1)
C <- tricolore:::TernaryMeshCentroids(2)[,-1]
tricolore:::TernaryNearest(P, C)




