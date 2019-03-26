library(ff)


### Name: ramattribs
### Title: Get ramclass and ramattribs
### Aliases: ramclass ramclass.ff ramclass.default ramclass_excludes
###   ramattribs ramattribs.ff ramattribs.default ramattribs_excludes
### Keywords: IO data attribute classes

### ** Examples

  x <- ff(as.POSIXct(as.POSIXlt(Sys.time(), "GMT")), length=12)
  x
  ramclass(x)
  ramattribs(x)
  class(x[])
  attributes(x[])
  virtual(x)$ramattribs$tzone = NULL
  attributes(x[])
  rm(x); gc()



