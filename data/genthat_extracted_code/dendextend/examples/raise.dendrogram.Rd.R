library(dendextend)


### Name: raise.dendrogram
### Title: Raise the height of a dendrogram tree
### Aliases: raise.dendrogram

### ** Examples

hc <- hclust(dist(USArrests[2:9,]), "com")
dend <- as.dendrogram(hc)

par(mfrow = c(1,2))
plot(dend, main = "original tree")
plot(raise.dendrogram(dend , 100), main = "Raised tree")



