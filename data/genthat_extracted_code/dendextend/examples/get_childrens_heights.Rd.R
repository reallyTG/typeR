library(dendextend)


### Name: get_childrens_heights
### Title: Get height attributes from a dendrogram's children
### Aliases: get_childrens_heights

### ** Examples


hc <- hclust(dist(USArrests[1:4,]), "ave")
dend <- as.dendrogram(hc)
get_childrens_heights(dend)





