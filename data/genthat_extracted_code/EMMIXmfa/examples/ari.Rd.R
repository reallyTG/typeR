library(EMMIXmfa)


### Name: ari
### Title: Computes adjusted Rand Index
### Aliases: ari
### Keywords: cluster

### ** Examples

set.seed(1984)
Y <- scale(iris[, -5])
model <- mfa(Y, g = 3, q = 3, nkmeans = 1, nrandom = 0)
#
ari(model$clust, iris[, 5])
#
minmis(model$clust, iris[, 5])



