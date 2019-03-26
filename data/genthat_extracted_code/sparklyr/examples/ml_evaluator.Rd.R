library(sparklyr)


### Name: ml_evaluator
### Title: Spark ML - Evaluators
### Aliases: ml_evaluator ml_binary_classification_evaluator
###   ml_binary_classification_eval ml_multiclass_classification_evaluator
###   ml_classification_eval ml_regression_evaluator

### ** Examples

## Not run: 
##D sc <- spark_connect(master = "local")
##D mtcars_tbl <- sdf_copy_to(sc, mtcars, name = "mtcars_tbl", overwrite = TRUE)
##D 
##D partitions <- mtcars_tbl %>%
##D   sdf_partition(training = 0.7, test = 0.3, seed = 1111)
##D 
##D mtcars_training <- partitions$training
##D mtcars_test <- partitions$test
##D 
##D # for multiclass classification
##D rf_model <- mtcars_training %>%
##D   ml_random_forest(cyl ~ ., type = "classification")
##D 
##D pred <- ml_predict(rf_model, mtcars_test)
##D 
##D ml_multiclass_classification_evaluator(pred)
##D 
##D # for regression
##D rf_model <- mtcars_training %>%
##D   ml_random_forest(cyl ~ ., type = "regression")
##D 
##D pred <- ml_predict(rf_model, mtcars_test)
##D 
##D ml_regression_evaluator(pred, label_col = "cyl")
##D 
##D # for binary classification
##D rf_model <- mtcars_training %>%
##D   ml_random_forest(am ~ gear + carb, type = "classification")
##D 
##D pred <- ml_predict(rf_model, mtcars_test)
##D 
##D ml_binary_classification_evaluator(pred)
## End(Not run)




