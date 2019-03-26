library(ecp)


### Name: e.cp3o
### Title: CHANGE POINTS ESTIMATION BY PRUNED OBJECTIVE (VIA E-STATISTIC)
### Aliases: e.cp3o
### Keywords: pruning dynamic

### ** Examples

set.seed(400)
x1 = matrix(c(rnorm(50),rnorm(50,3)))
y1 = e.cp3o(Z=x1, K=2, minsize=30, alpha=1, verbose=FALSE)
#View estimated change point locations
y1$estimates



