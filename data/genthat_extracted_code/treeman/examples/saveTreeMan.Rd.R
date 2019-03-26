library(treeman)


### Name: saveTreeMan
### Title: Save a TreeMan object in serialization format
### Aliases: saveTreeMan

### ** Examples

library(treeman)
tree <- randTree(100, wndmtrx=TRUE)
saveTreeMan(tree, file='test.RData')
rm(tree)
tree <- loadTreeMan(file='test.RData')
file.remove('test.RData', 'testRData_ndmtrx')



