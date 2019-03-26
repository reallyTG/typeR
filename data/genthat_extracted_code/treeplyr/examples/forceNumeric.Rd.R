library(treeplyr)


### Name: forceNumeric
### Title: Function for checking whether a treedata object contains only
###   numeric columns and for forcing data columns into numeric format
### Aliases: forceNumeric

### ** Examples

data(anolis)
td <- make.treedata(anolis$phy, anolis$dat)
tdnumeric <- forceNumeric(td)



