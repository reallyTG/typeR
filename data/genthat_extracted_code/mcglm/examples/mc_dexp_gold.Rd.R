library(mcglm)


### Name: mc_dexp_gold
### Title: Exponential-matrix and its derivatives
### Aliases: mc_dexp_gold
### Keywords: internal

### ** Examples

M <- matrix(c(1,0.8,0.8,1), 2,2)
dM <- matrix(c(0,1,1,0),2,2)
mcglm::mc_dexp_gold(M = M, dM = dM)



