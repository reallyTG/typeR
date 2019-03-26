library(binda)


### Name: is.binaryMatrix
### Title: Check For Binary Matrix
### Aliases: is.binaryMatrix
### Keywords: univar

### ** Examples

# load binda library
library("binda")

# test matrix
m = matrix(c(1, 1, 0, 1, 0, 0,
             1, 1, 1, 1, 0, 0,
             1, 0, 0, 0, 1, 1,
             1, 0, 0, 0, 1, 1), nrow=4, byrow=TRUE)

# Test for binary matrix
is.binaryMatrix(m) # TRUE



