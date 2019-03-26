library(clusteval)


### Name: cluster_similarity
### Title: Computes the similarity between two clusterings of the same data
###   set.
### Aliases: cluster_similarity

### ** Examples

# Notice that the number of comemberships is 'n choose 2'.
iris_kmeans <- kmeans(iris[, -5], centers = 3)$cluster
iris_hclust <- cutree(hclust(dist(iris[, -5])), k = 3)
cluster_similarity(iris_kmeans, iris_hclust)



