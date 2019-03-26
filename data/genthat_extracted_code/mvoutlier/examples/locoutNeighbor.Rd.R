library(mvoutlier)


### Name: locoutNeighbor
### Title: Diagnostic plot for identifying local outliers with varying size
###   of neighborhood
### Aliases: locoutNeighbor
### Keywords: multivariate robust

### ** Examples

# use data from illustrative example in paper:
data(X)
data(Y)
data(dat)
res <- locoutNeighbor(dat,X,Y,variant="knn",usemax=1,chisqqu=0.975,indices=c(1,11,24,36),
              propneighb=0.1,npoints=100)



