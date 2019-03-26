library(signal)


### Name: roots
### Title: Roots of a polynomial
### Aliases: roots
### Keywords: math

### ** Examples

roots(1:3)
polyroot(3:1) # should be the same
poly(roots(1:3))

roots(1:3, method="eigen") # using eigenvalues



