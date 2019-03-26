library(bit)


### Name: clone
### Title: Cloning ff and ram objects
### Aliases: clone clone.list clone.default still.identical
### Keywords: IO data

### ** Examples

  x <- 1:12
  y <- x
  still.identical(x,y)
  y[1] <- y[1]
  still.identical(x,y)
  y <- clone(x)
  still.identical(x,y)
  rm(x,y); gc()



