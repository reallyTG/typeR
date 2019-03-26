library(ff)


### Name: readwrite.ff
### Title: Reading and writing vectors (low-level)
### Aliases: read.ff write.ff readwrite.ff
### Keywords: IO data

### ** Examples

  x <- ff(0, length=12)
  read.ff(x, 3, 6)
  write.ff(x, 3, rep(1, 6))
  x
  write.ff(x, 3, rep(1, 6), add=TRUE)
  x
  readwrite.ff(x, 3, rep(1, 6), add=TRUE)
  readwrite.ff(x, 3, rep(1, 6))
  x
  rm(x); gc()



