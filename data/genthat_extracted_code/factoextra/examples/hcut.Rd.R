library(factoextra)


### Name: hcut
### Title: Computes Hierarchical Clustering and Cut the Tree
### Aliases: hcut

### ** Examples

## No test: 
data(USArrests)

# Compute hierarchical clustering and cut into 4 clusters
res <- hcut(USArrests, k = 4, stand = TRUE)

# Cluster assignements of observations
res$cluster
# Size of clusters
res$size

# Visualize the dendrogram
fviz_dend(res, rect = TRUE)

# Visualize the silhouette
fviz_silhouette(res)

# Visualize clusters as scatter plots
fviz_cluster(res)
## End(No test)




