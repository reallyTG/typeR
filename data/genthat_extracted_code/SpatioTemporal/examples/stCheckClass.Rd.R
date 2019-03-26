library(SpatioTemporal)


### Name: stCheckClass
### Title: Test if an object belongs to given class(es).
### Aliases: stCheckClass

### ** Examples

  ##create a basic object
  x <- 1
  class(x) <- "test"
  ## should be ok
  stCheckClass(x, "test", "x")
  ## this fails
  try( stCheckClass(x, "other", "x") )




