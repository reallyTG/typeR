library(permutations)


### Name: sgn
### Title: Sign of a permutation
### Aliases: sgn is.even

### ** Examples


sgn(id)  # always problematic

sgn(rperm(10,5))

x <- rperm(40,6)
y <- rperm(40,6)


stopifnot(all(sgn(x*y) == sgn(x)*sgn(y)))   # sgn() is a homomorphism


z <- as.cycle(rperm(20,9,5))
z[is.even(z)]




