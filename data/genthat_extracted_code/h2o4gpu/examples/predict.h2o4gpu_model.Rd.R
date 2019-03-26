library(h2o4gpu)


### Name: predict.h2o4gpu_model
### Title: Make Predictions using Trained H2O4GPU Estimator
### Aliases: predict.h2o4gpu_model

### ** Examples

## Not run: 
##D 
##D library(h2o4gpu)
##D 
##D # Setup dataset
##D x <- iris[1:4]
##D y <- as.integer(iris$Species) - 1
##D 
##D # Initialize and train the classifier
##D model <- h2o4gpu.random_forest_classifier() %>% fit(x, y)
##D 
##D # Make predictions
##D predictions <- model %>% predict(x)
##D 
## End(Not run)




