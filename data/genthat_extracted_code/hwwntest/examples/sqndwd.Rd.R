library(hwwntest)


### Name: sqndwd
### Title: Compute the non-decimated squared wavelet transform.
### Aliases: sqndwd
### Keywords: math

### ** Examples

#
# Random data
#
x <- rnorm(16)
#
# Compute the projection of x onto the squared wavelets... 
#
ans <- sqndwd(x, ec=sqcoefvec(m0=2, filter.number=4))



