library(ff)


### Name: vt
### Title: Virtual transpose
### Aliases: vt vt.ff vt.default t.ff
### Keywords: IO data array

### ** Examples

  x <- ff(1:20, dim=c(4,5))
  x
  vt(x)
  y <- t(x)
  y
  vw(x) <- cbind(c(1,3,0),c(1,4,0))
  x
  vt(x)
  y <- t(x)
  y
  rm(x,y); gc()



