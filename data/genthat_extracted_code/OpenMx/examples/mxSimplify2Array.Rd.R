library(OpenMx)


### Name: mxSimplify2Array
### Title: Like simplify2array but works with vectors of different lengths
### Aliases: mxSimplify2Array

### ** Examples

v1 <- 1:3
v2 <- 4:5
v3 <- 6:10
mxSimplify2Array(list(v1,v2,v3))

#     [,1] [,2] [,3]
# [1,]    1    4    6
# [2,]    2    5    7
# [3,]    3   NA    8
# [4,]   NA   NA    9
# [5,]   NA   NA   10



