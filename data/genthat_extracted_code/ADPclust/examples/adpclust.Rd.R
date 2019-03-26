library(ADPclust)


### Name: adpclust
### Title: Fast Clustering Using Adaptive Density Peak Detection
### Aliases: adpclust

### ** Examples

# Load a data set with 3 clusters
data(clust3)

# Automatically select cluster centroids
ans <- adpclust(clust3, centroids = "auto", draw = FALSE)
summary(ans)
plot(ans)

# Specify distm instead of data
distm <- FindDistm(clust3, normalize = TRUE)
ans.distm <- adpclust(distm = distm, p = 2, centroids = "auto", draw = FALSE)
identical(ans, ans.distm)

# Specify the grid of h and nclust
ans <- adpclust(clust3, centroids = "auto", h = c(0.1, 0.2, 0.3), nclust = 2:6)

# Specify that bandwidths should be searched around
# Wand's Asymptotic-Mean-Integrated-Squared-Error bandwidth
# Also test 3 to 6 clusters.
ans <- adpclust(clust3, centroids = "auto", htype = "AMISE", nclust = 3:6)

# Set a specific bandwidth value.
ans <- adpclust(clust3, centroids = "auto", h = 5)

# Change method of automatic selection of centers
ans <- adpclust(clust3, centroids = "auto", nclust = 2:6, ac = 2)

# Specify that the single "ROT" bandwidth value by
# using the 'ROT()' function
ans <- adpclust(clust3, centroids = "auto", h = ROT(clust3))

# Centroids selected by user
## Not run: 
##D ans <- adpclust(clust3, centroids = "user", h = ROT(clust3))
## End(Not run)

# A larger data set
data(clust5)
ans <- adpclust(clust5, centroids = "auto", htype = "ROT", nclust = 3:5)
summary(ans)
plot(ans)



