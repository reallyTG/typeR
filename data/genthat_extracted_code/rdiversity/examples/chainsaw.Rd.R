library(rdiversity)


### Name: chainsaw
### Title: Function to cut phylogeny from present day species to a
###   specified depth.
### Aliases: chainsaw

### ** Examples

tree <- ape::rtree(n = 5)
tree$tip.label <- paste0("sp", seq_along(tree$tip.label))
partition <- cbind(a = c(1,1,1,0,0), b = c(0,1,0,1,1))
row.names(partition) <- tree$tip.label
partition <- partition / sum(partition)
ps <- phy_struct(tree, partition)

a <- chainsaw(partition, ps, depth = 0.9)
b <- chainsaw(partition, ps, depth = 2)
z <- chainsaw(partition, ps, depth = 0)
m <- chainsaw(partition, ps, depth = 1)




