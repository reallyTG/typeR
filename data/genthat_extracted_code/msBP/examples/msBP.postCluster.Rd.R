library(msBP)


### Name: msBP.postCluster
### Title: Posterior cluster allocation
### Aliases: msBP.postCluster
### Keywords: multiscale clustering

### ** Examples

set.seed(1)
y <- rbeta(30, 5, 1)
weights <-structure(list( 
	T = list(0, c(0,0.10), c(0.0,0,0.3,0.6)), max.s=2), 
	class  = 'binaryTree')
sh <- msBP.postCluster(y, weights)
clus.size <- msBP.nrvTrees(sh)$n
plot(clus.size)



