library(pracma)


### Name: rref
### Title: Reduced Row Echelon Form
### Aliases: rref
### Keywords: math

### ** Examples

A <- matrix(c(1, 2, 3, 1, 3, 2, 3, 2, 1), 3, 3, byrow = TRUE)
rref(A)       
#      [,1] [,2] [,3]
# [1,]    1    0    0
# [2,]    0    1    0
# [3,]    0    0    1

A <- matrix(data=c(1, 2, 3, 2, 5, 9, 5, 7, 8,20, 100, 200),
            nrow=3, ncol=4, byrow=FALSE)  
rref(A)
#   1    0    0  120
#   0    1    0    0
#   0    0    1  -20

# Use rref on a rank-deficient magic square:
A = magic(4)
R = rref(A)
zapsmall(R)
#   1    0    0    1
#   0    1    0    3
#   0    0    1   -3
#   0    0    0    0



