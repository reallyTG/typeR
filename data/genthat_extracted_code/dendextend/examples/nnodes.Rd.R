library(dendextend)


### Name: nnodes
### Title: Counts the number of nodes (Vertices) in a tree
### Aliases: nnodes nnodes.default nnodes.dendrogram nnodes.hclust
###   nnodes.phylo

### ** Examples

hc <- hclust(dist(USArrests[1:5,]), "ave")
dend <- as.dendrogram(hc)

nnodes(dend) # 9
nnodes(hc) # 9



