library(spatstat)


### Name: scanpp
### Title: Read Point Pattern From Data File
### Aliases: scanpp
### Keywords: spatial IO

### ** Examples

  ##  files installed with spatstat, for demonstration
  d <- system.file("rawdata", "finpines", package="spatstat.data")
  if(nzchar(d)) {
    W <- owin(c(-5,5), c(-8,2))
    X <- scanpp("finpines.txt", dir=d, window=W)
    print(X)
  }
  d <- system.file("rawdata", "amacrine", package="spatstat.data")
  if(nzchar(d)) {
    W <- owin(c(0, 1060/662), c(0, 1))
    Y <- scanpp("amacrine.txt", dir=d, window=W, factor.marks=TRUE)
    print(Y)
  }



