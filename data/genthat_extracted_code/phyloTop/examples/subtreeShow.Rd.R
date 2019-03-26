library(phyloTop)


### Name: subtreeShow
### Title: Highlight a subtree
### Aliases: subtreeShow

### ** Examples

## Highlight the clade(s) descending from nodes 23 and 35 in a random tree on 20 tips:
tree <- rtree(20)
subtreeShow(tree, nodeList=c(23,35))
# change aesthetics:
subtreeShow(tree,nodeList=c(23,35), mainCol="navy", subtreeCol="cyan", 
   nodeLabelCol="cyan", edge.width=2)
   




