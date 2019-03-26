library(spatstat.utils)


### Name: do.call.matched
### Title: Call a Function, Passing Only Recognised Arguments
### Aliases: do.call.matched
### Keywords: programming utilities

### ** Examples

  f <- function(x=0,y=0, ...) { paste(x, y, ..., sep=", ") }
  f()
  do.call.matched(f, list(y=2))
  do.call.matched(f, list(y=2, z=5), extrargs="z")
  do.call.matched(f, list(y=2, z=5), extrargs="z", skipargs="y")



