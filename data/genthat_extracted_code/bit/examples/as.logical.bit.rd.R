library(bit)


### Name: as.logical.bit
### Title: Coercion from bit, bitwhich and ri to logical, integer, double
### Aliases: as.logical.bit as.integer.bit as.double.bit
###   as.logical.bitwhich as.integer.bitwhich as.double.bitwhich
###   as.logical.ri as.integer.ri as.double.ri
### Keywords: classes logic

### ** Examples

  x <- ri(2, 5, 10)
  y <- as.logical(x)
  y
  stopifnot(identical(y, as.logical(as.bit(x))))
  stopifnot(identical(y, as.logical(as.bitwhich(x))))

  y <- as.integer(x)
  y
  stopifnot(identical(y, as.integer(as.logical(x))))
  stopifnot(identical(y, as.integer(as.bit(x))))
  stopifnot(identical(y, as.integer(as.bitwhich(x))))

  y <- as.double(x)
  y
  stopifnot(identical(y, as.double(as.logical(x))))
  stopifnot(identical(y, as.double(as.bit(x))))
  stopifnot(identical(y, as.double(as.bitwhich(x))))



