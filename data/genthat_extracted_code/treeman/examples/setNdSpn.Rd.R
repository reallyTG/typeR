library(treeman)


### Name: setNdSpn
### Title: Set the branch length of a specific node
### Aliases: setNdSpn

### ** Examples

library(treeman)
tree <- randTree(10)
tree <- setNdSpn(tree, id='t1', val=100)
tree <- updateSlts(tree)
summary(tree)



