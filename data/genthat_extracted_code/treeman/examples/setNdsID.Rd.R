library(treeman)


### Name: setNdsID
### Title: Set the IDs of multiple nodes
### Aliases: setNdsID

### ** Examples

library(treeman)
tree <- randTree(10)
new_ids <- paste0('heffalump_', 1:tree['ntips'])
tree <- setNdsID(tree, tree['tips'], new_ids)
summary(tree)



