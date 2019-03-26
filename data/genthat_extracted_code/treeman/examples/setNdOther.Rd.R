library(treeman)


### Name: setNdOther
### Title: Set a user defined slot
### Aliases: setNdOther

### ** Examples

library(treeman)
tree <- randTree(10)
tree <- setNdOther(tree, 't1', 1, 'binary_val')
tree <- updateSlts(tree)
(getNdSlt(tree, id='t1', slt_nm='binary_val'))



