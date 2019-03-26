library(ff)


### Name: physical.ffdf
### Title: Getting physical and virtual attributes of ffdf objects
### Aliases: physical.ffdf virtual.ffdf
### Keywords: IO data

### ** Examples

  x <- 1:2
  y <- matrix(1:4, 2, 2)
  z <- matrix(1:4, 2, 2)

  message("Here the y matrix is first converted to single columns by data.frame, 
then those columns become ff")
  d <- as.ffdf(data.frame(x=x, y=y, z=I(z)))
  physical(d)
  virtual(d)

  message("Here the y matrix is first converted to ff, and then stored still as matrix 
in the ffdf object (although virtually treated as columns of ffdf)")
  d <- ffdf(x=as.ff(x), y=as.ff(y), z=I(as.ff(z)))
  physical(d)
  virtual(d)

  message("Apply the usual methods extracting physical attributes")
  lapply(physical(d), filename)
  lapply(physical(d), vmode)
  message("And don't confuse with virtual vmode")
  vmode(d)

  rm(d); gc()



