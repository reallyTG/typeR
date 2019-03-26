library(ff)


### Name: clone
### Title: Cloning ff and ram objects
### Aliases: clone clone.ff clone.list clone.default
### Keywords: IO data

### ** Examples

  x <- ff(letters, levels=letters)
  y <- clone(x, length=52)
  rm(x,y); gc()



