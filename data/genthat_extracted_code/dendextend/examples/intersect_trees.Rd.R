library(dendextend)


### Name: intersect_trees
### Title: Intersect trees
### Aliases: intersect_trees

### ** Examples

hc <- hclust(dist(USArrests[1:5,]), "ave")
dend <- as.dendrogram(hc)
labels(dend) <- 1:5
dend1 <- prune(dend, 1)
dend2 <- prune(dend, 5)
intersect_dend <- intersect_trees(dend1, dend2)

layout(matrix(c(1,1,2,3,4,5), 3,2, byrow=TRUE))
plot(dend, main = "Original tree")
plot(dend1, main = "Tree 1:\n original with label 1 pruned");
   plot(dend2, main = "Tree 2:\n original with label 2 pruned")
plot(intersect_dend[[1]], 
      main = "Tree 1 pruned
      with the labels that intersected with those of Tree 2")
   plot(intersect_dend[[2]],
      main = "Tree 2 pruned
      with the labels that intersected with those of Tree 1")




