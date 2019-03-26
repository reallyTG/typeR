library(data.tree)


### Name: as.Node.dendrogram
### Title: Convert a 'dendrogram' to a data.tree 'Node'
### Aliases: as.Node.dendrogram

### ** Examples

hc <- hclust(dist(USArrests), "ave")
dend1 <- as.dendrogram(hc)
tree1 <- as.Node(dend1)
tree1$fieldsAll
tree1$totalCount
tree1$leafCount
tree1$height
  



