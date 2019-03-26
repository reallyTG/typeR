library(sparklyr)


### Name: ml_gbt_classifier
### Title: Spark ML - Gradient Boosted Trees
### Aliases: ml_gbt_classifier ml_gradient_boosted_trees ml_gbt_regressor

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
##D gbt_model <- iris_training %>%
##D   ml_gradient_boosted_trees(Sepal_Length ~ Petal_Length + Petal_Width)
##D 
##D pred <- ml_predict(gbt_model, iris_test)
##D 
##D ml_regression_evaluator(pred, label_col = "Sepal_Length")
## End(Not run)




