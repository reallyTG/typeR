library(grt)


### Name: unscale
### Title: Un-scale or re-center the scaled or centered Matrix-like object
### Aliases: unscale
### Keywords: array

### ** Examples

require(stats)
x <- matrix(1:10, ncol=2)
unscale(z <- scale(x))

#maybe useful for truncating
trunc <- 1
z[abs(z) > trunc] <- sign(z[abs(z) > trunc])*trunc
unscale(z)



