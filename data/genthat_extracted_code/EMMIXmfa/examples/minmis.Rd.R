library(EMMIXmfa)


### Name: minmis
### Title: Minimum Number of Misallocations
### Aliases: minmis
### Keywords: cluster

### ** Examples

set.seed(1984)
Y <- scale(iris[, -5])
model <- mcfa(Y, g = 3, q = 3, nkmeans = 1, nrandom = 0, itmax = 200)
ari(model$clust, iris[, 5])
minmis(model$clust, iris[, 5])



