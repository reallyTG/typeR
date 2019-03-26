library(waveslim)


### Name: Dualtree Complex
### Title: Dual-tree Complex 2D Discrete Wavelet Transform
### Aliases: cplxdual2D icplxdual2D
### Keywords: ts

### ** Examples

## Not run: 
##D ## EXAMPLE: cplxdual2D
##D x = matrix(rnorm(32*32), 32, 32)
##D J = 5
##D Faf = FSfarras()$af
##D Fsf = FSfarras()$sf
##D af = dualfilt1()$af
##D sf = dualfilt1()$sf
##D w = cplxdual2D(x, J, Faf, af)
##D y = icplxdual2D(w, J, Fsf, sf)
##D err = x - y
##D max(abs(err))
## End(Not run)



