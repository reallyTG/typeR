library(dae)


### Name: fac.meanop
### Title: computes the projection matrix that produces means
### Aliases: fac.meanop
### Keywords: array projector

### ** Examples

## set up a two-level factor and a three-level factor, both of length 12
A <- factor(rep(1:2, each=6))
B <- factor(rep(1:3, each=2, times=2))

## create a generalized factor whose levels are the combinations of A and B
AB <- fac.combine(list(A,B))

## obtain the operator that computes the AB means from a vector of length 12
M.AB <- fac.meanop(AB)



