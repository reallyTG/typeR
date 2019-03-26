library(dendextend)


### Name: prune
### Title: Prunes a tree (using leaves' labels)
### Aliases: prune prune.default prune.dendrogram prune.hclust prune.phylo
###   prune.rpart

### ** Examples

hc <- hclust(dist(USArrests[1:5,]), "ave")
dend <- as.dendrogram(hc)

par(mfrow = c(1,2))
plot(dend, main = "original tree")
plot(prune(dend , c("Alaska", "California")), main = "tree without Alaska and California")


# this works because prune uses reindex_dend = TRUE by default
as.hclust(prune(dend , c("Alaska", "California")))
prune(hc , c("Alaska", "California"))





