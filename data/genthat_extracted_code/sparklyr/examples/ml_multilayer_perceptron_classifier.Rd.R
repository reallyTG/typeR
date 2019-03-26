library(sparklyr)


### Name: ml_multilayer_perceptron_classifier
### Title: Spark ML - Multilayer Perceptron
### Aliases: ml_multilayer_perceptron_classifier ml_multilayer_perceptron

### ** Examples

## Not run: 
##D sc <-  spark_connect(master = "local")
##D 
##D iris_tbl <- sdf_copy_to(sc, iris, name = "iris_tbl", overwrite = TRUE)
##D partitions <- iris_tbl %>%
##D   sdf_partition(training = 0.7, test = 0.3, seed = 1111)
##D 
##D iris_training <- partitions$training
##D iris_test <- partitions$test
##D 
##D mlp_model <- iris_training %>%
##D   ml_multilayer_perceptron_classifier(Species ~ ., layers = c(4,3,3))
##D 
##D pred <- ml_predict(mlp_model, iris_test)
##D 
##D ml_multiclass_classification_evaluator(pred)
## End(Not run)



