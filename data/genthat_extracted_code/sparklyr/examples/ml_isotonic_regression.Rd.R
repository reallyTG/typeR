library(sparklyr)


### Name: ml_isotonic_regression
### Title: Spark ML - Isotonic Regression
### Aliases: ml_isotonic_regression

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
##D iso_res <- iris_tbl %>%
##D   ml_isotonic_regression(Petal_Length ~ Petal_Width)
##D 
##D pred <- ml_predict(iso_res, iris_test)
##D 
##D pred
## End(Not run)




