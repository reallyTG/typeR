library(SMITIDvisu)


### Name: transmissionTree
### Title: transmissionTree
### Aliases: transmissionTree

### ** Examples

library(SMITIDvisu)
data(transmissiontree)
tt <- transmissionTree(tt.nodes,tt.edges, nodes.color = list("default"="black","Inf"="red"))
## No test: 
## export as standalone html file
htmlwidgets::saveWidget(tt, "transTree.html")
browseURL("transTree.html")
## End(No test)




