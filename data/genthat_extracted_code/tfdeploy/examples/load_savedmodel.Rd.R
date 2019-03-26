library(tfdeploy)


### Name: load_savedmodel
### Title: Load a SavedModel
### Aliases: load_savedmodel

### ** Examples

## Not run: 
##D # start session
##D sess <- tensorflow::tf$Session()
##D 
##D # preload an existing model into a TensorFlow session
##D graph <- tfdeploy::load_savedmodel(
##D   sess,
##D   system.file("models/tensorflow-mnist", package = "tfdeploy")
##D )
##D 
##D # perform prediction based on a pre-loaded model
##D tfdeploy::predict_savedmodel(
##D   list(rep(9, 784)),
##D   graph
##D )
##D 
##D # close session
##D sess$close()
## End(Not run)




