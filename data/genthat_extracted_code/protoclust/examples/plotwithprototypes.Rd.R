library(protoclust)


### Name: plotwithprototypes
### Title: Plot dendrogram with prototype labels added
### Aliases: plotwithprototypes
### Keywords: cluster

### ** Examples

# generate some data:
set.seed(1)
n <- 100
p <- 2
x <- matrix(rnorm(n * p), n, p)
rownames(x) <- paste("A", 1:n, sep="")
d <- dist(x)

# perform minimax linkage clustering:
hc <- protoclust(d)

# cut the tree to yield a 10-cluster clustering:
k <- 10 # number of clusters
cut <- protocut(hc, k=k)
h <- hc$height[n - k]

# plot dendrogram (and show cut):
plotwithprototypes(hc, imerge=cut$imerge)
# or more simply: plot(hc, imerge=cut$imerge)
abline(h=h, lty=2)

# negative values of imerge specify which leaves to label
k2 <- 20 # more clusters... with two singletons
cut2 <- protocut(hc, k=k2)
h2 <- hc$height[n - k2]
plot(hc, hang=-1, imerge=cut2$imerge)
abline(h=h2, lty=2)



