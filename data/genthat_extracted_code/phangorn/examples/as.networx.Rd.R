library(phangorn)


### Name: as.networx
### Title: Phylogenetic networks
### Aliases: as.networx networx as.networx.splits as.networx.phylo
###   plot.networx
### Keywords: plot

### ** Examples


set.seed(1)
tree1 <- rtree(20, rooted=FALSE)
sp <- as.splits(rNNI(tree1, n=10))
net <- as.networx(sp)
plot(net, "2D")
## Not run: 
##D # also see example in consensusNet 
##D example(consensusNet)
## End(Not run)




