library(treeman)


### Name: rmTips
### Title: Remove tips from a tree
### Aliases: rmTips

### ** Examples

library(treeman)
tree <- randTree(10)
tree <- rmTips(tree, 't1')
summary(tree)
# running the function using an internal
# node will create a corrupted tree
tree <- rmTips(tree, 'n3')
# run summary() to make sure a change has
# not created a corruption
#summary(tree)



