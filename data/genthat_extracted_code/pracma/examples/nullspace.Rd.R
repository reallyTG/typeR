library(pracma)


### Name: nullspace
### Title: Kernel or Nullspace
### Aliases: nullspace null
### Keywords: array

### ** Examples

M <- matrix(1:12, 3, 4)
Rank(M)                 #=> 2
N <- nullspace(M)
#           [,1]       [,2]      [,3]
# [1,] 0.4082483 -0.8164966 0.4082483
M 

M1 <- matrix(1:6, 2, 3)  # of rank 2
M2 <- t(M1)
nullspace(M1)            # corresponds to 1 -2  1
nullspace(M2)            # NULL, i.e. 0 0

M <- magic(5)
Rank(M)                 #=> 5
nullspace(M)             #=> NULL, i.e. 0 0 0 0 0



