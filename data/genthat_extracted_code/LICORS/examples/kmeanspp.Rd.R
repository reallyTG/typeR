library(LICORS)


### Name: kmeanspp
### Title: Kmeans++
### Aliases: kmeanspp
### Keywords: cluster multivariate

### ** Examples

set.seed(1984)
nn <- 100
XX <- matrix(rnorm(nn), ncol = 2)
YY <- matrix(runif(length(XX) * 2, -1, 1), ncol = ncol(XX))
ZZ <- rbind(XX, YY)

cluster_ZZ <- kmeanspp(ZZ, k = 5, start = "random")

plot(ZZ, col = cluster_ZZ$cluster + 1, pch = 19)



