library(TotalCopheneticIndex)


### Name: list.ancestors
### Title: List ancestors
### Aliases: list.ancestors

### ** Examples

  tree   <- ape::read.tree(text='(1, (2, (3, (4, 5))));')
  edge   <- tree$edge
  parent <- tree$edge[, 1]
  child  <- tree$edge[, 2]
  list.ancestors(parent, child, 4)



