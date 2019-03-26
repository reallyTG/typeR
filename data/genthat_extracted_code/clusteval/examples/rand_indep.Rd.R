library(clusteval)


### Name: rand_indep
### Title: Computes the Rand similarity index of two clusterings of the
###   same data set under the assumption that the two clusterings are
###   independent.
### Aliases: rand_indep

### ** Examples

## Not run: 
##D # We generate K = 3 labels for each of n = 10 observations and compute the
##D # Rand similarity index between the two clusterings.
##D set.seed(42)
##D K <- 3
##D n <- 10
##D labels1 <- sample.int(K, n, replace = TRUE)
##D labels2 <- sample.int(K, n, replace = TRUE)
##D rand_indep(labels1, labels2)
##D 
##D # Here, we cluster the \code{iris} data set with the K-means and
##D # hierarchical algorithms using the true number of clusters, K = 3.
##D # Then, we compute the Rand similarity index between the two clusterings.
##D iris_kmeans <- kmeans(iris[, -5], centers = 3)$cluster
##D iris_hclust <- cutree(hclust(dist(iris[, -5])), k = 3)
##D rand_indep(iris_kmeans, iris_hclust)
## End(Not run)



