library(nws)


### Name: isClosure
### Title: Determine if a Worker Function is a Closure
### Aliases: isClosure
### Keywords: debugging utilities

### ** Examples

# this should return FALSE
isClosure(sqrt)
f <- function(x) function(y) x + y
g <- f(1)
# this should return TRUE
isClosure(g)



