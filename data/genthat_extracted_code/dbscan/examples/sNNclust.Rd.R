library(dbscan)


### Name: sNNclust
### Title: Shared Nearest Neighbor Clustering
### Aliases: sNNclust snnclust
### Keywords: model clustering

### ** Examples

data("DS3")

# Out of k = 20 NN 7 (eps) have to be shared to create a link in the sNN graph.
# A point needs a least 16 (minPts) links in the sNN graph to be a core point.
# Noise points have cluster id 0 and are shown in black.
cl <- sNNclust(DS3, k = 20, eps = 7, minPts = 16)
plot(DS3, col = cl$cluster + 1L, cex = .5)



