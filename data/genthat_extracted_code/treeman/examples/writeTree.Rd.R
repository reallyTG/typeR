library(treeman)


### Name: writeTree
### Title: Write a Newick tree
### Aliases: writeTree

### ** Examples

library(treeman)
tree <- randTree(10)
# write out the tree with node labels as IDs
ndLabels <- function(n) {
n[['id']]
}
writeTree(tree, file='example.tre', ndLabels=ndLabels)
file.remove('example.tre')



