library(ecp)


### Name: ks.cp3o
### Title: CHANGE POINTS ESTIMATION BY PRUNED OBJECTIVE (VIA
###   KOLMOGOROV-SMIRNOV STATISTIC)
### Aliases: ks.cp3o
### Keywords: pruning dynamic

### ** Examples

set.seed(400)
x = matrix(c(rnorm(100),rnorm(100,3),rnorm(100,0,2)))
y = ks.cp3o(Z=x, K=7, minsize=30, verbose=FALSE)
#View estimated change point locations
y$estimates



