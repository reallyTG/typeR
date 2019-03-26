library(TreeSearch)


### Name: AddTip
### Title: Add a tip to a phylogenetic tree
### Aliases: AddTip
### Keywords: tree

### ** Examples

{
  library('ape')
  plot(tree <- rtree(10, br=NULL)); nodelabels(); nodelabels(15, 15, bg='green'); dev.new()
  plot(AddTip(tree, 15, 'NEW_TIP'))
}



