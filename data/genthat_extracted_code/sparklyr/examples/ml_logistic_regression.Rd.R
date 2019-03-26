library(sparklyr)


### Name: ml_logistic_regression
### Title: Spark ML - Logistic Regression
### Aliases: ml_logistic_regression

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
##D lr_model <- mtcars_training %>%
##D   ml_logistic_regression(am ~ gear + carb)
##D 
##D pred <- ml_predict(lr_model, mtcars_test)
##D 
##D ml_binary_classification_evaluator(pred)
## End(Not run)




