library(itertools)


### Name: iarray
### Title: Create an iterator over an array
### Aliases: iarray
### Keywords: utilities

### ** Examples

  # Iterate over matrices in a 3D array
  x <- array(1:24, c(2,3,4))
  as.list(iarray(x, 3))

  # Iterate over subarrays
  as.list(iarray(x, 3, chunks=2))

  x <- array(1:64, c(4,4,4))
  it <- iarray(x, c(2,3), chunks=c(1,2))
  jt <- nextElem(it)
  nextElem(jt)
  jt <- nextElem(it)
  nextElem(jt)

  it <- iarray(x, c(2,3), chunks=c(2,2))
  jt <- nextElem(it)
  nextElem(jt)
  nextElem(jt)
  jt <- nextElem(it)
  nextElem(jt)
  nextElem(jt)



