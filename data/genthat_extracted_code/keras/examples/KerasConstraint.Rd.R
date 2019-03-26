library(keras)


### Name: KerasConstraint
### Title: Base R6 class for Keras constraints
### Aliases: KerasConstraint
### Keywords: datasets

### ** Examples

## Not run: 
##D CustomNonNegConstraint <- R6::R6Class(
##D   "CustomNonNegConstraint",
##D   inherit = KerasConstraint,
##D   public = list(
##D     call = function(x) {
##D        w * k_cast(k_greater_equal(w, 0), k_floatx())
##D     }
##D   )
##D )
##D 
##D layer_dense(units = 32, input_shape = c(784), 
##D             kernel_constraint = CustomNonNegConstraint$new())
## End(Not run)




