library(paleotree)


### Name: unitLengthTree
### Title: Scale Tree to Unit-Length
### Aliases: unitLengthTree

### ** Examples


set.seed(444)
tree <- rtree(10)
layout(1:2)
plot(tree)
plot(unitLengthTree(tree))
layout(1)




