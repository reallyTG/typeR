library(phyloTop)


### Name: getDepths
### Title: Find the depth of each node
### Aliases: getDepths

### ** Examples

## Find the node depths in a random tree:
tree <- rtree(20)
treeDepths <- getDepths(tree)
## Plot tree with node depths labelled:
tree$tip.label <- treeDepths$tipDepths
tree$node.label <- treeDepths$nodeDepths
plot(tree, show.node.label=TRUE)





