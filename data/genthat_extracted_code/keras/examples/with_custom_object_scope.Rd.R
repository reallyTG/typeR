library(keras)


### Name: with_custom_object_scope
### Title: Provide a scope with mappings of names to custom objects
### Aliases: with_custom_object_scope

### ** Examples

## Not run: 
##D # define custom metric
##D metric_top_3_categorical_accuracy <- 
##D   custom_metric("top_3_categorical_accuracy", function(y_true, y_pred) {
##D     metric_top_k_categorical_accuracy(y_true, y_pred, k = 3) 
##D   })
##D 
##D with_custom_object_scope(c(top_k_acc = sparse_top_k_cat_acc), {
##D 
##D   # ...define model...
##D   
##D   # compile model (refer to "top_k_acc" by name)
##D   model %>% compile(
##D     loss = "binary_crossentropy",
##D     optimizer = optimizer_nadam(),
##D     metrics = c("top_k_acc")
##D   )
##D 
##D   # save the model
##D   save_model_hdf5("my_model.h5")
##D 
##D   # loading the model within the custom object scope doesn't
##D   # require explicitly providing the custom_object
##D   load_model_hdf5("my_model.h5")
##D })
## End(Not run)




