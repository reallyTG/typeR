library(ff)


### Name: names.ff
### Title: Getting and setting names
### Aliases: names.ff names<-.ff names.ff_array names<-.ff_array
### Keywords: IO data

### ** Examples

  x <- ff(1:26, names=letters)
  names(x)
  names(x) <- LETTERS
  names(x)
  names(x) <- NULL
  names(x)
  rm(x); gc()



