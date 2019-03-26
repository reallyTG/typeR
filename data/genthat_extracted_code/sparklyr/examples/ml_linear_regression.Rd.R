library(sparklyr)


### Name: ml_linear_regression
### Title: Spark ML - Linear Regression
### Aliases: ml_linear_regression

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
##D lm_model <- mtcars_training %>%
##D   ml_linear_regression(mpg ~ .)
##D 
##D pred <- ml_predict(lm_model, mtcars_test)
##D 
##D ml_regression_evaluator(pred, label_col = "mpg")
## End(Not run)



