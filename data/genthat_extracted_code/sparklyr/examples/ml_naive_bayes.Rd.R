library(sparklyr)


### Name: ml_naive_bayes
### Title: Spark ML - Naive-Bayes
### Aliases: ml_naive_bayes

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
##D nb_model <- iris_training %>%
##D   ml_naive_bayes(Species ~ .)
##D 
##D pred <- ml_predict(nb_model, iris_test)
##D 
##D ml_multiclass_classification_evaluator(pred)
## End(Not run)




