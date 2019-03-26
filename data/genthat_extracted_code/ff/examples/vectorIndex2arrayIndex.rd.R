library(ff)


### Name: vectorIndex2arrayIndex
### Title: Array: make array from index vector positions
### Aliases: vectorIndex2arrayIndex
### Keywords: array data

### ** Examples

  matrix(1:12, 3, 4)
  vectorIndex2arrayIndex(1:12, dim=3:4)
  vectorIndex2arrayIndex(1:12, dim=3:4, dimorder=2:1)
  matrix(1:30, 5, 6)
  vectorIndex2arrayIndex(c(6L, 7L, 8L, 11L, 12L, 13L, 16L, 17L, 18L, 21L, 22L, 23L)
, vw=rbind(c(0,1), c(3,4), c(2,1)))
  vectorIndex2arrayIndex(c(2L, 8L, 14L, 3L, 9L, 15L, 4L, 10L, 16L, 5L, 11L, 17L)
, vw=rbind(c(0,1), c(3,4), c(2,1)), dimorder=2:1)

  ## Don't show: 
    # incomplete regression tests
    x <- matrix(1:12, 3, 4)
    i <- cbind(as.vector(row(x)), as.vector(col(x)))
    stopifnot(identical( array(arrayIndex2vectorIndex(i, dim=dim(x)), dim=dim(x)), x ))
    stopifnot(identical( vectorIndex2arrayIndex(arrayIndex2vectorIndex(i, dim=dim(x), dimorder=1:2), dim=dim(x)), i ))

    y <- vector2array(1:12, c(3,4), 2:1)
    i <- cbind(as.vector(row(y)), as.vector(col(y)))
    stopifnot(identical( array(arrayIndex2vectorIndex(i, dim=dim(y), dimorder=2:1), dim=dim(y)), y ))
    stopifnot(identical( vectorIndex2arrayIndex(arrayIndex2vectorIndex(i, dim=dim(y), dimorder=dimorder(y)), dim=dim(y), dimorder=dimorder(y)), i ))

    z <- vector2array(1:24, dim=4:2, dimorder=c(2,1,3))
    stopifnot(identical( arrayIndex2vectorIndex(vectorIndex2arrayIndex(z, dim=dim(z), dimorder=c(2,1,3)), dim=dim(z), dimorder=c(2,1,3)), as.vector(z) ))
  
## End(Don't show)



