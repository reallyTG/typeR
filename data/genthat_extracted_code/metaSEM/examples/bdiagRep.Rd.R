library(metaSEM)


### Name: bdiagRep
### Title: Create a Block Diagonal Matrix by Repeating the Input
### Aliases: bdiagRep
### Keywords: utilities

### ** Examples

## Block diagonal matrix of numerics
bdiagRep( matrix(1:4,nrow=2,ncol=2), 2 )
#      [,1] [,2] [,3] [,4]
# [1,]    1    3    0    0
# [2,]    2    4    0    0
# [3,]    0    0    1    3
# [4,]    0    0    2    4

## Block diagonal matrix of characters
bdiagRep( matrix(letters[1:4],nrow=2,ncol=2), 2 )
#      [,1] [,2] [,3] [,4]
# [1,] "a"  "c"  "0"  "0" 
# [2,] "b"  "d"  "0"  "0" 
# [3,] "0"  "0"  "a"  "c" 
# [4,] "0"  "0"  "b"  "d" 



