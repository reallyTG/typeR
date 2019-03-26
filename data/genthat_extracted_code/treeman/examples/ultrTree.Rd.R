library(treeman)


### Name: ultrTree
### Title: Make tree ultrametric
### Aliases: ultrTree

### ** Examples

library(treeman)
tree <- randTree(10)
(getDcsd(tree))  # list all extinct tips
tree <- ultrTree(tree)
(getDcsd(tree))  # list all extinct tips



