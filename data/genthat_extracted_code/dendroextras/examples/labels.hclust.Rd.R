library(dendroextras)


### Name: labels.hclust
### Title: Find labels of hclust object (in dendrogram order)
### Aliases: labels.hclust

### ** Examples

hc <- hclust(dist(USArrests), "ave")
dend <- as.dendrogram(hc)
stopifnot(all.equal(labels(hc),labels(dend)))



