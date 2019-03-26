library(h2o4gpu)


### Name: fit.h2o4gpu_model
### Title: Train an H2O4GPU Estimator
### Aliases: fit.h2o4gpu_model

### ** Examples

## Not run: 
##D 
##D library(h2o4gpu)
##D 
##D # Setup dataset
##D x <- iris[1:4]
##D y <- as.integer(iris$Species) - 1
##D 
##D # Train the classifier
##D h2o4gpu.random_forest_classifier() %>% fit(x, y)
## End(Not run)



