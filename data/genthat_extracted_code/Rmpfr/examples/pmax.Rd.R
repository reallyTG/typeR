library(Rmpfr)


### Name: pmax
### Title: Parallel Maxima and Minima
### Aliases: pmax pmin pmax-methods pmin-methods pmax,ANY-method
###   pmax,mNumber-method pmin,ANY-method pmin,mNumber-method
### Keywords: methods univar arith

### ** Examples

 (pm <- pmin(1.35, mpfr(0:10, 77)))
 stopifnot(pm == pmin(1.35, 0:10))



