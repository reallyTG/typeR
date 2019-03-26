library(dendroextras)


### Name: set_leaf_colours
### Title: Set the leaf colours of a dendrogram
### Aliases: set_leaf_colours set_leaf_colors set_leaf_colors

### ** Examples

d5=colour_clusters(hclust(dist(USArrests), "ave"),5)
dred=set_leaf_colours(d5,'red','edge')
stopifnot(isTRUE(all(leaf_colours(dred)=='red')))
d52=set_leaf_colours(d5,leaf_colours(d5),'edge')
stopifnot(all.equal(d5,d52))



