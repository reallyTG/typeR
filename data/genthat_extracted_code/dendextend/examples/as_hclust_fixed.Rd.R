library(dendextend)


### Name: as_hclust_fixed
### Title: Convert dendrogram Objects to Class hclust
### Aliases: as_hclust_fixed

### ** Examples

hc <- hclust(dist(USArrests[1:3,]), "ave")
dend <- as.dendrogram(hc)

as.hclust(dend)
as_hclust_fixed(dend, hc)



