library(metaSEM)


### Name: as.mxMatrix
### Title: Convert a Matrix into MxMatrix-class
### Aliases: as.mxMatrix
### Keywords: utilities

### ** Examples

## a and b are free parameters with starting values and labels
(a1 <- matrix(c(1:4, "5*a", 6, "7*b", 8, 9), ncol=3, nrow=3))
#      [,1] [,2]  [,3] 
# [1,] "1"  "4"   "7*b"
# [2,] "2"  "5*a" "8"  
# [3,] "3"  "6"   "9"  

a1 <- as.mxMatrix(a1)

## a and b are fixed parameters without any labels, name="new2"
(a2 <- matrix(1:9, ncol=3, nrow=3))
#      [,1] [,2] [,3]
# [1,]    1    4    7
# [2,]    2    5    8
# [3,]    3    6    9

new2 <- as.mxMatrix(a2, name="new2")

## Free parameters without starting values
(a3 <- matrix(c(1:4, "*a", 6, "*b", 8, 9), ncol=3, nrow=3))
#      [,1] [,2] [,3]
# [1,] "1"  "4"  "*b"
# [2,] "2"  "*a" "8" 
# [3,] "3"  "6"  "9" 

a3 <- as.mxMatrix(a3, lbound=0)

## A free parameter without label
(a4 <- matrix(c(1:4, "5*", 6, "7*b", 8, 9), ncol=3, nrow=3))
#      [,1] [,2] [,3] 
# [1,] "1"  "4"  "7*b"
# [2,] "2"  "5*" "8"  
# [3,] "3"  "6"  "9"  

a4 <- as.mxMatrix(a4)

## Convert a scalar into mxMatrix object
## "name" is required as "3*a" is not a valid name.
(a5 <- as.mxMatrix("3*a", name="a5"))



