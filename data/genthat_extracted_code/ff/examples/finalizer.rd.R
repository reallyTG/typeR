library(ff)


### Name: finalizer
### Title: Get and set finalizer (name)
### Aliases: finalizer finalizer<- finalizer.ff finalizer<-.ff
### Keywords: IO

### ** Examples

  x <- ff(1:12, pattern="./finalizerdemo")
  fnam <- filename(x)
  finalizer(x)
  finalizer(x) <- "delete"
  finalizer(x)
  rm(x)
  file.exists(fnam)
  gc()
  file.exists(fnam)



