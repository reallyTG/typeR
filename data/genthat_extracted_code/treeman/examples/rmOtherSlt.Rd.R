library(treeman)


### Name: rmOtherSlt
### Title: Remove a user-defined slot
### Aliases: rmOtherSlt

### ** Examples

library(treeman)
tree <- randTree(10)
vals <- runif(min=0, max=1, n=tree['nall'])
tree <- setNdsOther(tree, tree['all'], vals, 'confidence')
tree <- updateSlts(tree)
summary(tree)
tree <- rmOtherSlt(tree, 'confidence')
tree <- updateSlts(tree)
summary(tree)



