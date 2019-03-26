library(sparklyr)


### Name: ml_generalized_linear_regression
### Title: Spark ML - Generalized Linear Regression
### Aliases: ml_generalized_linear_regression

### ** Examples

## Not run: 
##D library(sparklyr)
##D 
##D sc <- spark_connect(master = "local")
##D mtcars_tbl <- sdf_copy_to(sc, mtcars, name = "mtcars_tbl", overwrite = TRUE)
##D 
##D partitions <- mtcars_tbl %>%
##D   sdf_partition(training = 0.7, test = 0.3, seed = 1111)
##D 
##D mtcars_training <- partitions$training
##D mtcars_test <- partitions$test
##D 
##D # Specify the grid
##D family <- c("gaussian", "gamma", "poisson")
##D link <- c("identity", "log")
##D family_link <- expand.grid(family = family, link = link, stringsAsFactors = FALSE)
##D family_link <- data.frame(family_link, rmse = 0)
##D 
##D # Train the models
##D for(i in 1:nrow(family_link)){
##D   glm_model <- mtcars_training %>%
##D     ml_generalized_linear_regression(mpg ~ .,
##D                                     family = family_link[i, 1],
##D                                     link = family_link[i, 2])
##D 
##D   pred <- ml_predict(glm_model, mtcars_test)
##D   family_link[i,3] <- ml_regression_evaluator(pred, label_col = "mpg")
##D }
##D 
##D family_link
## End(Not run)




