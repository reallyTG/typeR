library(Rmpfr)


### Name: sapplyMpfr
### Title: Apply a Function over a "mpfr" Vector
### Aliases: sapplyMpfr
### Keywords: manip

### ** Examples

## The function is simply defined as
function (X, FUN, ...)
  new("mpfr", unlist(lapply(X, FUN, ...), recursive = FALSE))

if(require("Bessel")) # here X, is simple
  bImp <- sapplyMpfr(0:4, function(k)
                     besselI.nuAsym(mpfr(1.31e9, 128), 10, expon.scaled=TRUE, k.max=k))



