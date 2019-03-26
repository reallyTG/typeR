library(rv)


### Name: Math.rv
### Title: Mathematical functions and Operators for rv Objects
### Aliases: Math.rv Ops.rv !.rv Math.rvsim Ops.rvsim cumsum.rv cumprod.rv
###   cummin.rv cummax.rv
### Keywords: classes

### ** Examples

 
  x <- rvnorm(10)
  -x
  names(x) <- paste("x[", seq_along(x), "]", sep="")
  x + 1:10
  1:2 + x
  cumsum(x)
  cumprod(exp(x))




