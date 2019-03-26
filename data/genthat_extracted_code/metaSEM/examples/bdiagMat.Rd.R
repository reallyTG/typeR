library(metaSEM)


### Name: bdiagMat
### Title: Create a Block Diagonal Matrix
### Aliases: bdiagMat
### Keywords: utilities

### ** Examples

## Block diagonal matrix of numerics
bdiagMat( list(matrix(1:4,nrow=2,ncol=2),
               matrix(5:6,nrow=1,ncol=2)) )
#      [,1] [,2] [,3] [,4]
# [1,]    1    3    0    0
# [2,]    2    4    0    0
# [3,]    0    0    5    6

## Block diagonal matrix of characters
bdiagMat( list(matrix(letters[1:4],nrow=2,ncol=2),
               matrix(letters[5:6],nrow=1,ncol=2)) )
#      [,1] [,2] [,3] [,4]
# [1,] "a"  "c"  "0"  "0" 
# [2,] "b"  "d"  "0"  "0" 
# [3,] "0"  "0"  "e"  "f" 



