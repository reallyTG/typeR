library(naniar)


### Name: add_miss_cluster
### Title: Add a column that tells us which "missingness cluster" a row
###   belongs to
### Aliases: add_miss_cluster

### ** Examples


add_miss_cluster(airquality)
add_miss_cluster(airquality, cluster_method = "ward.D")
add_miss_cluster(airquality, cluster_method = "ward.D", n_clusters = 3)
add_miss_cluster(airquality, n_clusters = 3)



