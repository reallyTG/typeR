library(ff)


### Name: as.integer.hi
### Title: Hybrid Index, coercing from
### Aliases: as.which.hi as.bitwhich.hi as.bit.hi as.integer.hi
###   as.logical.hi as.character.hi as.matrix.hi
### Keywords: IO data

### ** Examples

  x <- 1:6
  names(x) <- letters[1:6]
  as.integer(as.hi(c(1:3)))
  as.logical(as.hi(c(TRUE,TRUE,TRUE,FALSE,FALSE,FALSE)))
  as.character(as.hi(letters[1:3], names=names(x)), names=names(x))
  x <- matrix(1:12, 6)
  as.matrix(as.hi(rbind(c(1,1), c(1,2), c(2,1)), dim=dim(x)), dim=dim(x))



