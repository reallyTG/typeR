library(ff)


### Name: open.ff
### Title: Opening an ff file
### Aliases: open.ff open.ffdf
### Keywords: IO data

### ** Examples

  x <- ff(1:12)
  close(x)
  is.open(x)
  open(x)
  is.open(x)
  close(x)
  is.open(x)
  x[]
  is.open(x)
  y <- x
  close(y)
  is.open(x)
  rm(x,y); gc()



