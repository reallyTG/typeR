library(dendextend)


### Name: get_branches_heights
### Title: Get height attributes from a dendrogram
### Aliases: get_branches_heights

### ** Examples


hc <- hclust(dist(USArrests[1:4,]), "ave")
dend <- as.dendrogram(hc)
get_branches_heights(dend)





