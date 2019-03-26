library(treeplyr)


### Name: select.treedata
### Title: Function for selecting columns from an object of class
###   'treedata'
### Aliases: select.treedata select.grouped_treedata

### ** Examples

data(anolis)
td <- make.treedata(anolis$phy, anolis$dat)
tdselect <- select(td, SVL, awesomeness)



