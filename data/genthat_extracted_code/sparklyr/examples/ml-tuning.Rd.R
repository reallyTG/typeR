library(sparklyr)


### Name: ml-tuning
### Title: Spark ML - Tuning
### Aliases: ml-tuning ml_sub_models ml_validation_metrics
###   ml_cross_validator ml_train_validation_split

### ** Examples

## Not run: 
##D sc <- spark_connect(master = "local")
##D iris_tbl <- sdf_copy_to(sc, iris, name = "iris_tbl", overwrite = TRUE)
##D 
##D # Create a pipeline
##D pipeline <- ml_pipeline(sc) %>%
##D   ft_r_formula(Species ~ . ) %>%
##D   ml_random_forest_classifier()
##D 
##D # Specify hyperparameter grid
##D grid <- list(
##D   random_forest = list(
##D     num_trees = c(5,10),
##D     max_depth = c(5,10),
##D     impurity = c("entropy", "gini")
##D   )
##D )
##D 
##D # Create the cross validator object
##D cv <- ml_cross_validator(
##D   sc, estimator = pipeline, estimator_param_maps = grid,
##D   evaluator = ml_multiclass_classification_evaluator(sc),
##D   num_folds = 3,
##D   parallelism = 4
##D )
##D 
##D # Train the models
##D cv_model <- ml_fit(cv, iris_tbl)
##D 
##D # Print the metrics
##D ml_validation_metrics(cv_model)
##D 
## End(Not run)




