library(dae)


### Name: fac.sumop
### Title: computes the summation matrix that produces sums corresponding
###   to a (generalized) factor
### Aliases: fac.sumop
### Keywords: array projector

### ** Examples

## set up a two-level factoir and a three-level factor, both of length 12
A <- factor(rep(1:2, each=6))
B <- factor(rep(1:3, each=2, times=2))

## create a generlaized factor whose levels are the combinations of A and B
AB <- fac.combine(list(A,B))

## obtain the operator that computes the AB means from a vector of length 12
S.AB <- fac.sumop(AB)



