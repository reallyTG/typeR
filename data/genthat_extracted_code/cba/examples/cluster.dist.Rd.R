library(cba)


### Name: cluster.dist
### Title: Clustering a Sparse Symmetric Distance Matrix
### Aliases: cluster.dist
### Keywords: cluster

### ** Examples

## 3 clusters (1 = connected)
x <- matrix(c(1,1,0,0,0,0,
	      1,1,0,0,0,0,
	      0,0,1,1,0,0,
	      0,0,1,1,0,0,
	      0,0,0,0,1,1,
	      0,0,0,0,1,1), ncol=6)
c <- cluster.dist(as.dist(!x), beta = 0) # invert and note that 0 >= 0
c



