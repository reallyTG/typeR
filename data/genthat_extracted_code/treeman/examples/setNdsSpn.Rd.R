library(treeman)


### Name: setNdsSpn
### Title: Set the branch lengths of specific nodes
### Aliases: setNdsSpn

### ** Examples

library(treeman)
tree <- randTree(10)
# make tree taxonomic
tree <- setNdsSpn(tree, ids=tree['all'], vals=1)
summary(tree)
# remove spns by setting all to 0
tree <- setNdsSpn(tree, ids=tree['all'], vals=0)
summary(tree)



