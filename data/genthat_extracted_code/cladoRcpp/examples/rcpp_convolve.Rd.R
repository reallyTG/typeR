library(cladoRcpp)


### Name: rcpp_convolve
### Title: Run C++ version of convolve(x,y, conj=TRUE, type="open")
### Aliases: rcpp_convolve

### ** Examples

# Set up 2 vectors, then convolve them
ca = c(1,2,3,4,5)
cb = c(2,2,2,2,2)
rcpp_convolve(a=ca, b=cb)

# Same as:
convolve(ca, cb, conj=TRUE, type="open")




