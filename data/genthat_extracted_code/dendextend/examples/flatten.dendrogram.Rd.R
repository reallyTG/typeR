library(dendextend)


### Name: flatten.dendrogram
### Title: Flatten the branches of a dendrogram's root
### Aliases: flatten.dendrogram

### ** Examples

hc <- hclust(dist(USArrests[2:9,]), "com")
dend <- as.dendrogram(hc)
attr(dend[[1]], "height") <- 150 # make the height un-equal

par(mfrow = c(1,2))
plot(dend, main = "original tree")
plot(flatten.dendrogram(dend), main = "Raised tree")



