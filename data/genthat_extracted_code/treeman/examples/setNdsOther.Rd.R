library(treeman)


### Name: setNdsOther
### Title: Set a user defined slot for multiple nodes
### Aliases: setNdsOther

### ** Examples

library(treeman)
tree <- randTree(10)
# e.g. confidences for nodes
vals <- runif(min=0, max=1, n=tree['nall'])
tree <- setNdsOther(tree, tree['all'], vals, 'confidence')
tree <- updateSlts(tree)
summary(tree)
(getNdsSlt(tree, ids=tree['all'], slt_nm='confidence'))



