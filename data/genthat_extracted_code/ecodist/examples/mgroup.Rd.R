library(ecodist)


### Name: mgroup
### Title: Mantel test for groups
### Aliases: mgroup
### Keywords: multivariate

### ** Examples


# Using a model matrix to test group membership

data(iris)
iris.d <- dist(iris[,1:4])
mgroup(iris.d, iris[,5])

# clustering-based example

data(graze)
graze.d <- dist(graze[, -c(1:2)])
graze.hclust <- hclust(graze.d)

clust.groups <- data.frame(
	k2 = cutree(graze.hclust, k = 2),
	k4 = cutree(graze.hclust, k = 4),
	k6 = cutree(graze.hclust, k = 6),
	k8 = cutree(graze.hclust, k = 8))

mgroup(graze.d, clust.groups, nperm=1000)




