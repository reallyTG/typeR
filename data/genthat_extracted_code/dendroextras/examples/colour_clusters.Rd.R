library(dendroextras)


### Name: colour_clusters
### Title: Colour sub-clusters of a tree (dendrogram/hclust) object
### Aliases: colour_clusters color_clusters color_clusters

### ** Examples

d5=colour_clusters(hclust(dist(USArrests), "ave"),5)
plot(d5)
d5g=colour_clusters(hclust(dist(USArrests), "ave"),5,groupLabels=TRUE)
plot(d5g)
d5gr=colour_clusters(hclust(dist(USArrests), "ave"),5,groupLabels=as.roman)
plot(d5gr)



