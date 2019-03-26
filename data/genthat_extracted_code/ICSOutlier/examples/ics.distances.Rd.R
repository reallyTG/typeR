library(ICSOutlier)


### Name: ics.distances
### Title: Squared ICS Distances for Invariant Coordinates
### Aliases: ics.distances
### Keywords: multivariate

### ** Examples

Z <- rmvnorm(1000, rep(0, 6))
Z[1:20, 1] <- Z[1:20, 1] + 5
A <- matrix(rnorm(36), ncol = 6)
X <- tcrossprod(Z, A)

pairs(X)
icsX <- ics2(X)

icsX.dist.all <- ics.distances(icsX, index = 1:6)
maha <- mahalanobis(X, center = colMeans(X), cov = cov(X))
# in this case the distances should be the same
plot(icsX.dist.all, maha)
all.equal(icsX.dist.all, maha)

icsX.dist.first <- ics.distances(icsX, index = 1)
plot(icsX.dist.first)






