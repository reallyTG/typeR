library(dendextend)


### Name: seriate_dendrogram
### Title: Rotates a dendrogram based on a seriation of a distance matrix
### Aliases: seriate_dendrogram

### ** Examples

## Not run: 
##D # library(dendextend)
##D d <- dist(USArrests)
##D hc <- hclust(d, "ave")
##D dend <- as.dendrogram(hc)
##D 
##D heatmap(as.matrix(USArrests))
##D 
##D dend2 <- seriate_dendrogram(dend, d)
##D heatmap(as.matrix(USArrests), Rowv = dend)
##D 
##D 
## End(Not run)



