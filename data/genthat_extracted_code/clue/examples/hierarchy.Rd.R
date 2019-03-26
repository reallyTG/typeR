library(clue)


### Name: hierarchy
### Title: Hierarchies
### Aliases: cl_hierarchy is.cl_hierarchy as.cl_hierarchy cl_dendrogram
###   is.cl_dendrogram as.cl_dendrogram plot.cl_dendrogram
### Keywords: cluster

### ** Examples

hcl <- hclust(dist(USArrests))
is.cl_dendrogram(hcl)
is.cl_hierarchy(hcl)



