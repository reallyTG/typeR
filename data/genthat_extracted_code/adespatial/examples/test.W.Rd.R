library(adespatial)


### Name: test.W
### Title: Function to compute and test eigenvectors of spatial weighting
###   matrices
### Aliases: test.W
### Keywords: spatial

### ** Examples


if(require(ade4) & require(spdep)){

data(oribatid)
# Hellinger transformation
fau <- sqrt(oribatid$fau / outer(apply(oribatid$fau, 1, sum), rep(1, ncol(oribatid$fau)), "*"))
# remove gradient effect
faudt <- resid(lm(as.matrix(fau) ~ as.matrix(oribatid$xy)))

# test a binary spatial weighting matrix
nbtri <- tri2nb(as.matrix(oribatid$xy))
tri.res <- test.W(faudt, nbtri)

maxi <- max(unlist(nbdists(nbtri, as.matrix(oribatid$xy))))

# test a simple spatial weighting function of the distance
f1 <- function(x) {1-(x)/(maxi)}
tri.f1 <- test.W(faudt, nbtri, f = f1, xy = as.matrix(oribatid$xy))

# test a spatial weighting function with various values of parameters
f2 <- function(x,dmax,y) {1-(x^y)/(dmax)^y}
tri.f2 <- test.W(faudt,nbtri, f = f2, y = 2:10, dmax = maxi, xy = as.matrix(oribatid$xy))
}




