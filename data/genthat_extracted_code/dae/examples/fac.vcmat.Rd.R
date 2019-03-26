library(dae)


### Name: fac.vcmat
### Title: forms the variance matrix for the variance component of a
###   (generalized) factor
### Aliases: fac.vcmat
### Keywords: array

### ** Examples

## set up a two-level factor and a three-level factor, both of length 12
A <- factor(rep(1:2, each=6))
B <- factor(rep(1:3, each=2, times=2))

## create a 12 x 12 ar1 matrix corrresponding to B
vc.B <- fac.vcmat(B, 2)



