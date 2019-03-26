library(treeplyr)


### Name: select_.treedata
### Title: Function for selecting columns from an object of class
###   'treedata'
### Aliases: select_.treedata select_.grouped_treedata

### ** Examples

data(anolis)
td <- make.treedata(anolis$phy, anolis$dat)
tdselect <- select(td, SVL, awesomeness)



