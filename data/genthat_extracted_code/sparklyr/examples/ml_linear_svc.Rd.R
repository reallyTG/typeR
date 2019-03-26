library(sparklyr)


### Name: ml_linear_svc
### Title: Spark ML - LinearSVC
### Aliases: ml_linear_svc

### ** Examples

## Not run: 
##D library(dplyr)
##D 
##D sc <- spark_connect(master = "local")
##D iris_tbl <- sdf_copy_to(sc, iris, name = "iris_tbl", overwrite = TRUE)
##D 
##D partitions <- iris_tbl %>%
##D   filter(Species != "setosa") %>%
##D   sdf_partition(training = 0.7, test = 0.3, seed = 1111)
##D 
##D iris_training <- partitions$training
##D iris_test <- partitions$test
##D 
##D svc_model <- iris_training %>%
##D   ml_linear_svc(Species ~ .)
##D 
##D pred <- ml_predict(svc_model, iris_test)
##D 
##D ml_binary_classification_evaluator(pred)
## End(Not run)



