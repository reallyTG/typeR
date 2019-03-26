library(phyloTop)


### Name: nodeImbFrac
### Title: Fraction of nodes with given imbalance
### Aliases: nodeImbFrac

### ** Examples

## Find the fraction of internal nodes with an imbalance of 5 or more, 
## in a random tree with 20 tips:
tree <- rtree(20)
plot(tree)
nodeImbFrac(tree,threshold=5) 




