library(keras)


### Name: metric_binary_accuracy
### Title: Model performance metrics
### Aliases: metric_binary_accuracy metric_binary_crossentropy
###   metric_categorical_accuracy metric_categorical_crossentropy
###   metric_cosine_proximity metric_hinge
###   metric_kullback_leibler_divergence metric_mean_absolute_error
###   metric_mean_absolute_percentage_error metric_mean_squared_error
###   metric_mean_squared_logarithmic_error metric_poisson
###   metric_sparse_categorical_crossentropy metric_squared_hinge
###   metric_top_k_categorical_accuracy
###   metric_sparse_top_k_categorical_accuracy custom_metric

### ** Examples

## Not run: 
##D 
##D # create metric using backend tensor functions
##D metric_mean_pred <- custom_metric("mean_pred", function(y_true, y_pred) {
##D   k_mean(y_pred) 
##D })
##D 
##D model %>% compile(
##D   optimizer = optimizer_rmsprop(),
##D   loss = loss_binary_crossentropy,
##D   metrics = c('accuracy', metric_mean_pred)
##D )
##D 
##D # create custom metric to wrap metric with parameter
##D metric_top_3_categorical_accuracy <- 
##D   custom_metric("top_3_categorical_accuracy", function(y_true, y_pred) {
##D     metric_top_k_categorical_accuracy(y_true, y_pred, k = 3) 
##D   })
##D 
##D model %>% compile(
##D   loss = 'categorical_crossentropy',
##D   optimizer = optimizer_rmsprop(),
##D   metrics = metric_top_3_categorical_accuracy
##D )
## End(Not run)



