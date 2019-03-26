library(splus2R)


### Name: MC
### Title: Make Closure for functions
### Aliases: MC
### Keywords: utilities

### ** Examples

f1 <- function(x, y) x+y
f2 <- MC(function(x, y) x*y, list(f1=f1))



