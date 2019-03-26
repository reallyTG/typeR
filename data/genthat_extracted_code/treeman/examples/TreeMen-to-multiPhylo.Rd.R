library(treeman)


### Name: TreeMen-to-multiPhylo
### Title: Convert TreeMen to multiPhylo
### Aliases: TreeMen-to-multiPhylo

### ** Examples

library(treeman)
library(ape)
trees <- cTrees(randTree(10), randTree(10), randTree(10))
trees <- as(trees, 'multiPhylo')



