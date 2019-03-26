library(treeman)


### Name: loadTreeMan
### Title: Load a TreeMan object in serialization format
### Aliases: loadTreeMan

### ** Examples

library(treeman)
tree <- randTree(100, wndmtrx=TRUE)
saveTreeMan(tree, file='test.RData')
rm(tree)
tree <- loadTreeMan(file='test.RData')
file.remove('test.RData', 'testRData_ndmtrx')



