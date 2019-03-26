library(metaSEM)


### Name: matrix2bdiag
### Title: Convert a Matrix into a Block Diagonal Matrix
### Aliases: matrix2bdiag
### Keywords: utilities

### ** Examples

(m1 <- matrix(1:12, ncol=6, byrow=TRUE))
#      [,1] [,2] [,3] [,4] [,5] [,6]
# [1,]    1    2    3    4    5    6
# [2,]    7    8    9   10   11   12

matrix2bdiag(m1)
#      [,1] [,2] [,3] [,4] [,5] [,6]
# [1,]    1    2    3    0    0    0
# [2,]    2    4    5    0    0    0
# [3,]    3    5    6    0    0    0
# [4,]    0    0    0    7    8    9
# [5,]    0    0    0    8   10   11
# [6,]    0    0    0    9   11   12



