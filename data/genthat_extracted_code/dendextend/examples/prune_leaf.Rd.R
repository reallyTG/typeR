library(dendextend)


### Name: prune_leaf
### Title: Trims one leaf from a dendrogram
### Aliases: prune_leaf

### ** Examples

hc <- hclust(dist(USArrests[1:5,]), "ave")
dend <- as.dendrogram(hc)

par(mfrow = c(1,2))
plot(dend, main = "original tree")
plot(prune_leaf(dend , "Alaska"), main = "tree without Alaska")





