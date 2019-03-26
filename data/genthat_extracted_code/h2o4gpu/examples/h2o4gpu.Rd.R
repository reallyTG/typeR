library(h2o4gpu)


### Name: h2o4gpu
### Title: h2o4gpu in R
### Aliases: h2o4gpu h2o4gpu-package

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



