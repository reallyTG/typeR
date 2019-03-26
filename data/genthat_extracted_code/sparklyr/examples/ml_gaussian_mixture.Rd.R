library(sparklyr)


### Name: ml_gaussian_mixture
### Title: Spark ML - Gaussian Mixture clustering.
### Aliases: ml_gaussian_mixture

### ** Examples

## Not run: 
##D sc <- spark_connect(master = "local")
##D iris_tbl <- sdf_copy_to(sc, iris, name = "iris_tbl", overwrite = TRUE)
##D 
##D gmm_model <- ml_gaussian_mixture(iris_tbl, Species ~ .)
##D pred <- sdf_predict(iris_tbl, gmm_model)
##D ml_clustering_evaluator(pred)
## End(Not run)



