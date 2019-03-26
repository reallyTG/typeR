library(keras)


### Name: KerasCallback
### Title: Base R6 class for Keras callbacks
### Aliases: KerasCallback
### Keywords: datasets

### ** Examples

## Not run: 
##D library(keras)
##D 
##D LossHistory <- R6::R6Class("LossHistory",
##D   inherit = KerasCallback,
##D   
##D   public = list(
##D   
##D     losses = NULL,
##D 
##D     on_batch_end = function(batch, logs = list()) {
##D       self$losses <- c(self$losses, logs[["loss"]])
##D     }
##D   )
##D )
## End(Not run)



