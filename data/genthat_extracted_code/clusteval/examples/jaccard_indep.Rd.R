library(clusteval)


### Name: jaccard_indep
### Title: Computes the Jaccard similarity coefficient of two clusterings
###   of the same data set under the assumption that the two clusterings
###   are independent.
### Aliases: jaccard_indep

### ** Examples

## Not run: 
##D # We generate K = 3 labels for each of n = 10 observations and compute the
##D # Jaccard similarity coefficient between the two clusterings.
##D set.seed(42)
##D K <- 3
##D n <- 10
##D labels1 <- sample.int(K, n, replace = TRUE)
##D labels2 <- sample.int(K, n, replace = TRUE)
##D jaccard_indep(labels1, labels2)
##D 
##D # Here, we cluster the \code{iris} data set with the K-means and
##D # hierarchical algorithms using the true number of clusters, K = 3.
##D # Then, we compute the Jaccard similarity coefficient between the two
##D # clusterings.
##D iris_kmeans <- kmeans(iris[, -5], centers = 3)$cluster
##D iris_hclust <- cutree(hclust(dist(iris[, -5])), k = 3)
##D jaccard_indep(iris_kmeans, iris_hclust)
## End(Not run)



