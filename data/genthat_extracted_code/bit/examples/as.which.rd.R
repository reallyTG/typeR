library(bit)


### Name: as.which
### Title: Coercion to (positive) integer positions
### Aliases: as.which as.which.default as.which.bitwhich as.which.bit
###   as.which.ri
### Keywords: classes logic

### ** Examples

  r <- ri(5, 20, 100)
  x <- as.which(r)
  x

  stopifnot(identical(x, as.which(as.logical(r))))
  stopifnot(identical(x, as.which(as.bitwhich(r))))
  stopifnot(identical(x, as.which(as.bit(r))))



