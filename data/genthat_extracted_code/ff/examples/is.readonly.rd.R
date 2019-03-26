library(ff)


### Name: is.readonly
### Title: Get readonly status
### Aliases: is.readonly is.readonly.ff
### Keywords: IO data

### ** Examples

  x <- ff(1:12)
  is.readonly(x)
  close(x)
  open(x, readonly=TRUE)
  is.readonly(x)
  close(x)
  is.readonly(x)
  rm(x)



