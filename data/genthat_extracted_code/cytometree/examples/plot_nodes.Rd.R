library(cytometree)


### Name: plot_nodes
### Title: Plot the distribution of the observed cells at each node of the
###   binary tree built using CytomeTree.
### Aliases: plot_nodes

### ** Examples


data(DLBCL)
myct <- CytomeTree(DLBCL[, c("FL1", "FL2", "FL4")], minleaf = 1, t=.1)
plot_nodes(myct)




