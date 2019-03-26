library(dendextend)


### Name: unbranch
### Title: unbranch trees
### Aliases: unbranch unbranch.default unbranch.dendrogram unbranch.hclust
###   unbranch.phylo

### ** Examples

hc <- hclust(dist(USArrests[2:9,]), "com")
dend <- as.dendrogram(hc)

par(mfrow = c(1,3))
plot(dend, main = "original tree")
plot(unbranch(dend , 1), main = "unbranched tree (left branch)")
plot(unbranch(dend , 2), main = "tree without  (right branch)")



