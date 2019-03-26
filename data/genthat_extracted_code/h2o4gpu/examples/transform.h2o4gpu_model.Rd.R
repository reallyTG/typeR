library(h2o4gpu)


### Name: transform.h2o4gpu_model
### Title: Transform a Dataset using Trained H2O4GPU Estimator
### Aliases: transform.h2o4gpu_model

### ** Examples

## Not run: 
##D 
##D library(h2o4gpu)
##D 
##D # Prepare data
##D iris$Species <- as.integer(iris$Species) # convert to numeric data
##D 
##D # Randomly sample 80% of the rows for the training set
##D set.seed(1)
##D train_idx <- sample(1:nrow(iris), 0.8*nrow(iris)) 
##D train <- iris[train_idx, ]
##D test <- iris[-train_idx, ]
##D 
##D # Train a K-Means model
##D model_km <- h2o4gpu.kmeans(n_clusters = 3L) %>% fit(train)
##D 
##D # Transform test data
##D test_dist <- model_km %>% transform(test)
##D 
## End(Not run)



