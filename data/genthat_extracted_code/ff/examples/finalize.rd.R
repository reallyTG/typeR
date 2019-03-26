library(ff)


### Name: finalize
### Title: Call finalizer
### Aliases: finalize finalize.ff_pointer finalize.ff finalize.ffdf
### Keywords: IO

### ** Examples

  x <- ff(1:12, pattern="./finalizerdemo")
  fnam <- filename(x)
  finalizer(x)
  is.open(x)
  file.exists(fnam)

  finalize(x)

  finalizer(x)
  is.open(x)
  file.exists(fnam)

  delete(x)
  finalizer(x)
  is.open(x)
  file.exists(fnam)

  rm(x)
  gc()



