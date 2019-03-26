library(ff)


### Name: dimnames.ff_array
### Title: Getting and setting dimnames
### Aliases: dimnames.ff dimnames.ff_array dimnames<-.ff_array
### Keywords: IO data

### ** Examples

  x <- ff(1:12, dim=c(3,4), dimnames=list(letters[1:3], LETTERS[1:4]))
  dimnames(x)
  dimnames(x) <- list(LETTERS[1:3], letters[1:4])
  dimnames(x)
  dimnames(x) <- NULL
  dimnames(x)
  rm(x); gc()



