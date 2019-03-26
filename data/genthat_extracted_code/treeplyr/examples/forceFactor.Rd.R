library(treeplyr)


### Name: forceFactor
### Title: Function for checking whether a treedata object contains only
###   factors and for forcing data columns into factor format
### Aliases: forceFactor

### ** Examples

data(anolis)
td <- make.treedata(anolis$phy, anolis$dat)
tdforcefactor <- forceFactor(td)



