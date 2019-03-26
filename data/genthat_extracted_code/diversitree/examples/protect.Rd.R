library(diversitree)


### Name: protect
### Title: Protect Function Evaluations
### Aliases: protect invert
### Keywords: programming internal

### ** Examples

f <- function(x) log(x)
g <- protect(f)
f(0) # -Inf
g(0, fail.value=-999) # -999

f <- function(x) {
  if ( x < 1 )
    stop("dummmy error")
  x
}
g <- protect(f)
## Not run: 
##D f(0) # error
## End(Not run)
g(0, fail.value=-999) # -999



