library(sparklyr)


### Name: ml_bisecting_kmeans
### Title: Spark ML - Bisecting K-Means Clustering
### Aliases: ml_bisecting_kmeans

### ** Examples

## Not run: 
##D library(dplyr)
##D 
##D sc <- spark_connect(master = "local")
##D iris_tbl <- sdf_copy_to(sc, iris, name = "iris_tbl", overwrite = TRUE)
##D 
##D iris_tbl %>%
##D   select(-Species) %>%
##D   ml_bisecting_kmeans(k = 4 , Species ~ .)
## End(Not run)




