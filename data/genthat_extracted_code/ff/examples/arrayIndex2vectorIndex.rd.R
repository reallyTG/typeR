library(ff)


### Name: arrayIndex2vectorIndex
### Title: Array: make vector positions from array index
### Aliases: arrayIndex2vectorIndex
### Keywords: array data

### ** Examples

  x <- matrix(1:12, 3, 4)
  x
  arrayIndex2vectorIndex(cbind(as.vector(row(x)), as.vector(col(x)))
  , dim=dim(x))
  arrayIndex2vectorIndex(cbind(as.vector(row(x)), as.vector(col(x)))
  , dim=dim(x), dimorder=2:1)
  matrix(1:30, 5, 6)
  arrayIndex2vectorIndex(cbind(as.vector(row(x)), as.vector(col(x)))
  , vw=rbind(c(0,1), c(3,4), c(2,1)))
  arrayIndex2vectorIndex(cbind(as.vector(row(x)), as.vector(col(x)))
  , vw=rbind(c(0,1), c(3,4), c(2,1)), dimorder=2:1)



