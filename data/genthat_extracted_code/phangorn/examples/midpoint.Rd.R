library(phangorn)


### Name: getRoot
### Title: Tree manipulation
### Aliases: getRoot midpoint midpoint.phylo midpoint.multiPhylo pruneTree
### Keywords: cluster

### ** Examples


tree <- unroot(rtree(10))
tree$node.label <- c("", round(runif(tree$Nnode-1), 3))

tree2 <- midpoint(tree)
tree3 <- pruneTree(tree, .5)

par(mfrow = c(3,1))
plot(tree, show.node.label=TRUE)
plot(tree2, show.node.label=TRUE)
plot(tree3, show.node.label=TRUE)




