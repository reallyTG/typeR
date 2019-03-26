library(sparklyr)


### Name: ml_kmeans
### Title: Spark ML - K-Means Clustering
### Aliases: ml_kmeans ml_compute_cost

### ** Examples

## Not run: 
##D sc <- spark_connect(master = "local")
##D iris_tbl <- sdf_copy_to(sc, iris, name = "iris_tbl", overwrite = TRUE)
##D ml_kmeans(iris_tbl, Species ~ .)
## End(Not run)




