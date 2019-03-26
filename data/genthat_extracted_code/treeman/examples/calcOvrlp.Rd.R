library(treeman)


### Name: calcOvrlp
### Title: Calculate phylogenetic overlap
### Aliases: calcOvrlp

### ** Examples

library(treeman)
tree <- randTree(10)
ids_1 <- sample(tree['tips'], 5)
ids_2 <- sample(tree['tips'], 5)
calcOvrlp(tree, ids_1, ids_2)



