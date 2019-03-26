library(FactoMineR)


### Name: HCPC
### Title: Hierarchical Clustering on Principle Components (HCPC)
### Aliases: HCPC
### Keywords: multivariate

### ** Examples

## Not run: 
##D data(iris)
##D # Principal Component Analysis:
##D res.pca <- PCA(iris[,1:4], graph=FALSE)
##D # Clustering, auto nb of clusters:
##D hc <- HCPC(res.pca, nb.clust=-1)
##D 
##D ### Construct a hierarchical tree from a partition (with 10 clusters)
##D ### (useful when the number of individuals is very important)
##D hc2 <- HCPC(iris[,1:4], kk=10, nb.clust=-1)
## End(Not run)



