library(seriation)


### Name: reorder.hclust
### Title: Reorder Dendrograms using Optimal Leaf Ordering
### Aliases: reorder reorder.hclust
### Keywords: optimize cluster

### ** Examples

## cluster European cities by distance
data("eurodist")
d <- as.dist(eurodist)
hc <- hclust(eurodist)
  
## plot original dendrogram and the reordered dendrograms  
plot(hc)  
plot(reorder(hc, d, method = "GW"))  
plot(reorder(hc, d, method = "OLO"))  



