library(cladoRcpp)


### Name: rcpp_mult2probvect
### Title: Get the product of multiplying each pair of values in a vector
###   (cross-product)
### Aliases: rcpp_mult2probvect

### ** Examples

ca = c(1,2,3,4,5)
cb = c(2,2,2,2,2)
rcpp_mult2probvect(a=ca, b=cb)

# Same as:
c(ca %o% cb)

# Or:
c(outer(ca, cb))

# Or:
tcrossprod(ca, cb)




