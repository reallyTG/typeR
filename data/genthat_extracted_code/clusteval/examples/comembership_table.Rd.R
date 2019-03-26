library(clusteval)


### Name: comembership_table
### Title: Calculates the 2x2 contingency table of agreements and
###   disagreements of comemberships from two vectors of clustering labels.
### Aliases: comembership_table

### ** Examples

# We generate K = 3 labels for each of n = 10 observations and compute the
# comembership for all 'n choose 2' pairs.
set.seed(42)
K <- 3
n <- 10
labels1 <- sample.int(K, n, replace = TRUE)
labels2 <- sample.int(K, n, replace = TRUE)
comembership_table(labels1, labels2)

# Here, we cluster the \code{iris} data set with the K-means and
# hierarchical algorithms using the true number of clusters, K = 3.
# Then, we compute the 2x2 contingency table agreements and disagreements of
#' the comemberships.
iris_kmeans <- kmeans(iris[, -5], centers = 3)$cluster
iris_hclust <- cutree(hclust(dist(iris[, -5])), k = 3)
comembership_table(iris_kmeans, iris_hclust)



