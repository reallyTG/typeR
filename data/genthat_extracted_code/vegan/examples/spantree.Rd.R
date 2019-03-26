library(vegan)


### Name: spantree
### Title: Minimum Spanning Tree
### Aliases: spantree cophenetic.spantree as.hclust.spantree plot.spantree
###   lines.spantree spandepth
### Keywords: multivariate

### ** Examples

data(dune)
dis <- vegdist(dune)
tr <- spantree(dis)
## Add tree to a metric scaling
plot(tr, cmdscale(dis), type = "t")
## Find a configuration to display the tree neatly
plot(tr, type = "t")
## Depths of nodes
depths <- spandepth(tr)
plot(tr, type = "t", label = depths)
## Plot as a dendrogram
cl <- as.hclust(tr)
plot(cl)
## cut hclust tree to classes and show in colours in spantree
plot(tr, col = cutree(cl, 5), pch=16)



