library(ape)


### Name: mst
### Title: Minimum Spanning Tree
### Aliases: mst plot.mst
### Keywords: multivariate

### ** Examples

require(stats)
X <- matrix(runif(200), 20, 10)
d <- dist(X)
PC <- prcomp(X)
M <- mst(d)
opar <- par()
par(mfcol = c(2, 2))
plot(M)
plot(M, graph = "nsca")
plot(M, x1 = PC$x[, 1], x2 = PC$x[, 2])
par(opar)



