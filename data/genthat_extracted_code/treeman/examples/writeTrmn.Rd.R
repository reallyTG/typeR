library(treeman)


### Name: writeTrmn
### Title: Write a .trmn tree
### Aliases: writeTrmn

### ** Examples

library(treeman)
tree <- randTree(10)
writeTrmn(tree, file='test.trmn')
tree <- readTrmn('test.trmn')
file.remove('test.trmn')



