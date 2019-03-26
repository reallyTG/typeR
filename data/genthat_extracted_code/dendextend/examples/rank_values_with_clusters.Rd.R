library(dendextend)


### Name: rank_values_with_clusters
### Title: Rank a vector based on clusters
### Aliases: rank_values_with_clusters

### ** Examples


rank_values_with_clusters(c(1,2,3))
rank_values_with_clusters(c(1,1,3))
rank_values_with_clusters(c(0.1,0.1,3000))
rank_values_with_clusters(c(3,1,2))
rank_values_with_clusters(c(1,3,3,3,3,3,3,4,2,2))

rank_values_with_clusters(c(3,1,2), ignore0 = TRUE)
rank_values_with_clusters(c(3,1,2), ignore0 = FALSE)
rank_values_with_clusters(c(3,1,0,2), ignore0 = TRUE)
rank_values_with_clusters(c(3,1,0,2), ignore0 = FALSE)





