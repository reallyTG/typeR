library(CEC)


### Name: cec
### Title: Cross-Entropy Clustering
### Aliases: cec
### Keywords: ~cec ~clustering

### ** Examples

#
# Cross-Entropy Clustering
#

## Example of clustering random data set of 3 Gaussians, 
## 10 random initial centers and 7% as minimal cluster size.

m1 = matrix(rnorm(2000, sd=1), ncol=2)
m2 = matrix(rnorm(2000, mean = 3, sd = 1.5), ncol = 2)
m3 = matrix(rnorm(2000, mean = 3, sd = 1), ncol = 2)
m3[,2] = m3[,2] - 5
m = rbind(m1, m2, m3)
par(ask = TRUE)
plot(m, cex = 0.5, pch = 19)
## Clustering result:
Z = cec(m, 10, iter.max = 100, card.min="7%")
plot(Z)
# Result:
Z
## Example of clustering mouse-like set using spherical Gaussian densities.
m = mouseset(n=7000, r.head=2, r.left.ear=1.1, r.right.ear=1.1, left.ear.dist=2.5,
right.ear.dist=2.5, dim=2)
plot(m, cex = 0.5, pch = 19)
## Clustering result:
Z = cec(m, 3, type="sp", iter.max = 100, nstart=4, card.min="5%")
plot(Z)
# Result:
Z

## Example of clustering data set "Tset" using "eigenvalues" clustering type.
data(Tset)
plot(Tset, cex = 0.5, pch = 19)
centers = init.centers(Tset, 2)
## Clustering result:
Z <- cec(Tset, 5, "eigenvalues", param=c(0.02,0.002), nstart=4)
plot(Z)
# Result:
Z

## Example of using CEC split method starting with a single cluster.
data(mixShapes)
plot(mixShapes, cex = 0.5, pch = 19)
## Clustering result:
Z <- cec(mixShapes, 1, split=TRUE)
plot(Z)
# Result:
Z



