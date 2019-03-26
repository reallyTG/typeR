library(dendextend)


### Name: sort_2_clusters_vectors
### Title: Sorts two clusters vector by their names
### Aliases: sort_2_clusters_vectors

### ** Examples


## Not run: 
##D 
##D set.seed(23235)
##D ss <- sample(1:150, 4 )
##D hc1 <- hclust(dist(iris[ss,-5]), "com")
##D hc2 <- hclust(dist(iris[ss,-5]), "single")
##D # dend1 <- as.dendrogram(hc1)
##D # dend2 <- as.dendrogram(hc2)
##D #    cutree(dend1)   
##D 
##D A1_clusters <- cutree(hc1, k=3)
##D A2_clusters <- sample(cutree(hc1, k=3))
##D 
##D sort_2_clusters_vectors(A1_clusters, A2_clusters, assume_sorted_vectors =TRUE) # no sorting
##D sort_2_clusters_vectors(A1_clusters, A2_clusters, assume_sorted_vectors =FALSE) # Sorted
##D 
##D 
## End(Not run)



