library(sparcl)


### Name: KMeansSparseCluster
### Title: Performs sparse k-means clustering
### Aliases: KMeansSparseCluster print.KMeansSparseCluster
###   plot.KMeansSparseCluster

### ** Examples

# generate data
set.seed(11)
x <- matrix(rnorm(50*70),ncol=70)
x[1:25,1:20] <- x[1:25,1:20]+1
x <- scale(x, TRUE, TRUE)
# choose tuning parameter
km.perm <- KMeansSparseCluster.permute(x,K=2,wbounds=seq(3,7,len=15),nperms=5)
print(km.perm)
plot(km.perm)
# run sparse k-means
km.out <- KMeansSparseCluster(x,K=2,wbounds=km.perm$bestw)
print(km.out)
plot(km.out)
# run sparse k-means for a range of tuning parameter values
km.out <- KMeansSparseCluster(x,K=2,wbounds=seq(1.3,4,len=8))
print(km.out)
plot(km.out)
# Run sparse k-means starting from a particular set of cluster centers
#in the k-means algorithm.
km.out <- KMeansSparseCluster(x,wbounds=2:7,centers=x[c(1,3,5),])



