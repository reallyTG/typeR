library(treeman)


### Name: readTrmn
### Title: Read a .trmn tree
### Aliases: readTrmn

### ** Examples

library(treeman)
tree <- randTree(10)
writeTrmn(tree, file='test.trmn')
tree <- readTrmn('test.trmn')
file.remove('test.trmn')



