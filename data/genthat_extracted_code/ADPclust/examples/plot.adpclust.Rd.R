library(ADPclust)


### Name: plot.adpclust
### Title: Visualize the result of adpclust()
### Aliases: plot.adpclust

### ** Examples

## Load a data set with 3 clusters
data(clust3)
## Automatically select cluster centroids
ans <- adpclust(clust3, centroids = "auto")
plot(ans)
plot(ans, to.plot = "fd")
plot(ans, to.plot = "cluster.sil")
plot(ans, to.plot = c("cluster.sil", "fd")) #Default



