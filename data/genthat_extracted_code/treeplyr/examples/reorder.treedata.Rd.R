library(treeplyr)


### Name: reorder
### Title: Reorder a 'treedata' object
### Aliases: reorder reorder.treedata

### ** Examples

data(anolis)
td <- make.treedata(anolis$phy, anolis$dat)
td <- reorder(td, "postorder")



