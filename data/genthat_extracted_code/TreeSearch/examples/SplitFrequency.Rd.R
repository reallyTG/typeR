library(TreeSearch)


### Name: SplitFrequency
### Title: Frequency of splits
### Aliases: SplitFrequency SplitNumber ForestSplits TreeSplits

### ** Examples

{
  library(ape) # for functions rtree & nodelabels
  set.seed(0) # Set seed so random trees are reproducable
  tree1 <- rtree(7)
  tree2 <- rtree(7)
  tree3 <- rtree(7)
  forest <- list(tree1, tree2, tree2, tree3, rtree(7))
  
  # Simple, but means counting each split in the forest twice:
  tree1Freqs <- SplitFrequency(tree1, forest)
  SplitFrequency(tree2, forest)
  
  plot(tree1)
  nodelabels(tree1Freqs, node=as.integer(names(tree1Freqs)))
}




