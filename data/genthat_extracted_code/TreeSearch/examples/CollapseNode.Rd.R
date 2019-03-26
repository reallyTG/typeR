library(TreeSearch)


### Name: CollapseNode
### Title: Collapse nodes on a phylogenetic tree
### Aliases: CollapseNode CollapseEdge

### ** Examples

  library(ape)
  set.seed(1)
  
  tree <- rtree(7)
  par(mfrow=c(2, 1), mar=rep(0.5, 4))
  plot(tree)
  nodelabels()
  edgelabels(round(tree$edge.length, 2), cex=0.6, frame='n', adj=c(1, -1))
  
  newTree <- CollapseNode(tree, c(12, 13))
  plot(newTree)
  nodelabels()
  edgelabels(round(newTree$edge.length, 2), cex=0.6, frame='n', adj=c(1, -1))




