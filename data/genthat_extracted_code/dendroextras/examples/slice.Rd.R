library(dendroextras)


### Name: slice
### Title: Cut a tree-like object into groups numbered in tree order
### Aliases: slice

### ** Examples

hc <- hclust(dist(USArrests), "ave")
# return groups, leaves ordered by dendrogram
slice(hc,k=5)
# return groups, leaves ordered as originally passed to hclust
slice(hc,k=5)[order(hc$order)]



