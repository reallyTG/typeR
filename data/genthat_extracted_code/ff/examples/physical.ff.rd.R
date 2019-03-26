library(ff)


### Name: physical.ff
### Title: Getting and setting physical and virtual attributes of ff
###   objects
### Aliases: physical.ff physical<-.ff virtual.ff virtual<-.ff
### Keywords: IO data attribute

### ** Examples

  x <- ff(1:12)
  x
  physical(x)
  virtual(x)
  y <- as.ram(x)
  physical(y)
  virtual(y)
  rm(x,y); gc()



