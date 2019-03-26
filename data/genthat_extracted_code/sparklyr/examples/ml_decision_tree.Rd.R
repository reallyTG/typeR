library(sparklyr)


### Name: ml_decision_tree_classifier
### Title: Spark ML - Decision Trees
### Aliases: ml_decision_tree_classifier ml_decision_tree
###   ml_decision_tree_regressor

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
##D dt_model <- iris_training %>%
##D   ml_decision_tree(Species ~ .)
##D 
##D pred <- ml_predict(dt_model, iris_test)
##D 
##D ml_multiclass_classification_evaluator(pred)
## End(Not run)




