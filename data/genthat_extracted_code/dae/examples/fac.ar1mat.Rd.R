library(dae)


### Name: fac.ar1mat
### Title: forms the ar1 correlation matrix for a (generalized) factor
### Aliases: fac.ar1mat
### Keywords: array

### ** Examples

## set up a two-level factor and a three-level factor, both of length 12
A <- factor(rep(1:2, each=6))
B <- factor(rep(1:3, each=2, times=2))

## create a 12 x 12 ar1 matrix corrresponding to B
ar1.B <- fac.ar1mat(B, 0.6)



