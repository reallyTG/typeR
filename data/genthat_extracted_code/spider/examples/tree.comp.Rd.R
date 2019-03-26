library(spider)


### Name: tree.comp
### Title: Tree comparisons
### Aliases: tree.comp
### Keywords: Utilities

### ** Examples


set.seed(15)
tr <- ape::rtree(15)
set.seed(22)
tr2 <- ape::rtree(15)
tree.comp(tr, tr2)
tree.comp(tr, tr2, method="PH85")
tree.comp(tr, tr2, method="shallow")




