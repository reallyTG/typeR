library(sparklyr)


### Name: ml_clustering_evaluator
### Title: Spark ML - Clustering Evaluator
### Aliases: ml_clustering_evaluator

### ** Examples

## Not run: 
##D sc <- spark_connect(master = "local")
##D iris_tbl <- sdf_copy_to(sc, iris, name = "iris_tbl", overwrite = TRUE)
##D 
##D partitions <- iris_tbl %>%
##D   sdf_partition(training = 0.7, test = 0.3, seed = 1111)
##D 
##D iris_training <- partitions$training
##D iris_test <- partitions$test
##D 
##D formula <- Species ~ .
##D 
##D # Train the models
##D kmeans_model <- ml_kmeans(iris_training, formula = formula)
##D b_kmeans_model <- ml_bisecting_kmeans(iris_training, formula = formula)
##D gmm_model <- ml_gaussian_mixture(iris_training, formula = formula)
##D 
##D # Predict
##D pred_kmeans <- ml_predict(kmeans_model, iris_test)
##D pred_b_kmeans <- ml_predict(b_kmeans_model, iris_test)
##D pred_gmm <- ml_predict(gmm_model, iris_test)
##D 
##D # Evaluate
##D ml_clustering_evaluator(pred_kmeans)
##D ml_clustering_evaluator(pred_b_kmeans)
##D ml_clustering_evaluator(pred_gmm)
## End(Not run)



