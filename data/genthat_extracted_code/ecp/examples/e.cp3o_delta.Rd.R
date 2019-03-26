library(ecp)


### Name: e.cp3o_delta
### Title: CHANGE POINTS ESTIMATION BY PRUNED OBJECTIVE (VIA E-STATISTIC)
### Aliases: e.cp3o_delta
### Keywords: pruning dynamic

### ** Examples

set.seed(400)
x1 = matrix(c(rnorm(100),rnorm(100,3),rnorm(100,0,2)))
y1 = e.cp3o_delta(Z=x1, K=7, delta=29, alpha=1, verbose=FALSE)
#View estimated change point locations
y1$estimates



