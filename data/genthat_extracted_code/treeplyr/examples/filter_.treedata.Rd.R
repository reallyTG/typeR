library(treeplyr)


### Name: filter_.treedata
### Title: Function for filtering rows from an object of class 'treedata'
### Aliases: filter_.treedata filter.treedata filter_.grouped_treedata
###   filter.grouped_treedata filter_.grouped_treedata

### ** Examples

data(anolis)
td <- make.treedata(anolis$phy, anolis$dat, name_column=1)
tdfilter <- filter(td, island=="Cuba", SVL > 3.5)



