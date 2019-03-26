library(sparcl)


### Name: KMeansSparseCluster.permute
### Title: Choose tuning parameter for sparse k-means clustering
### Aliases: KMeansSparseCluster.permute print.KMeansSparseCluster.permute
###   plot.KMeansSparseCluster.permute

### ** Examples

# generate data
set.seed(11)
x <- matrix(rnorm(50*70),ncol=70)
x[1:25,1:10] <- x[1:25,1:10]+1.5
x <- scale(x, TRUE, TRUE)
# choose tuning parameter
km.perm <-
KMeansSparseCluster.permute(x,K=2,wbounds=seq(2,5,len=8),nperms=3)
print(km.perm)
plot(km.perm)
# run sparse k-means
km.out <- KMeansSparseCluster(x,K=2,wbounds=km.perm$bestw)
print(km.out)
plot(km.out)
# run sparse k-means for a range of tuning parameter values
km.out <- KMeansSparseCluster(x,K=2,wbounds=2:7)
print(km.out)
plot(km.out)
# Repeat, but this time start with a particular choice of cluster
# centers.
# This will do 4-means clustering starting with this particular choice
# of cluster centers.
km.perm.out <- KMeansSparseCluster.permute(x,wbounds=2:6, centers=x[1:4,],nperms=3)
print(km.out)
plot(km.out)



