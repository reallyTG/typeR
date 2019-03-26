library(Oncotree)


### Name: oncotree
### Title: Build and display an oncogenetic tree
### Aliases: oncotree.fit print.oncotree plot.oncotree pstree.oncotree
### Keywords: models tree graphs hplot

### ** Examples

  data(ov.cgh)
  ov.tree <- oncotree.fit(ov.cgh, error.fun=function(x,y){max(abs(x-y))})
  ov.tree
  nodes <- plot(ov.tree, edge.weights="est")
  #move the Root node to the left
  nodes["x","Root"] <- nodes["x","8q+"]
  plot(ov.tree, node.coords=nodes)
  #output for pstricks+pst-tree
  pstree.oncotree(ov.tree, edge.weights="obs", shape="oval")



