## ----setup, include = FALSE----------------------------------------------
library(keras)
knitr::opts_chunk$set(comment = NA, eval = FALSE)

## ------------------------------------------------------------------------
#  library(keras)
#  
#  CustomLayer <- R6::R6Class("CustomLayer",
#  
#    inherit = KerasLayer,
#  
#    public = list(
#  
#      output_dim = NULL,
#  
#      kernel = NULL,
#  
#      initialize = function(output_dim) {
#        self$output_dim <- output_dim
#      },
#  
#      build = function(input_shape) {
#        self$kernel <- self$add_weight(
#          name = 'kernel',
#          shape = list(input_shape[[2]], self$output_dim),
#          initializer = initializer_random_normal(),
#          trainable = TRUE
#        )
#      },
#  
#      call = function(x, mask = NULL) {
#        k_dot(x, self$kernel)
#      },
#  
#      compute_output_shape = function(input_shape) {
#        list(input_shape[[1]], self$output_dim)
#      }
#    )
#  )

## ------------------------------------------------------------------------
#  # define layer wrapper function
#  layer_custom <- function(object, output_dim, name = NULL, trainable = TRUE) {
#    create_layer(CustomLayer, object, list(
#      output_dim = as.integer(output_dim),
#      name = name,
#      trainable = trainable
#    ))
#  }
#  
#  # use it in a model
#  model <- keras_model_sequential()
#  model %>%
#    layer_dense(units = 32, input_shape = c(32,32)) %>%
#    layer_custom(output_dim = 32)

