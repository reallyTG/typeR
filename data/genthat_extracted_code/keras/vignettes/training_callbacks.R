## ----setup, include = FALSE----------------------------------------------
library(keras)
knitr::opts_chunk$set(comment = NA, eval = FALSE)

## ------------------------------------------------------------------------
#  library(keras)
#  
#  # generate dummy training data
#  data <- matrix(rexp(1000*784), nrow = 1000, ncol = 784)
#  labels <- matrix(round(runif(1000*10, min = 0, max = 9)), nrow = 1000, ncol = 10)
#  
#  # create model
#  model <- keras_model_sequential()
#  
#  # add layers and compile
#  model %>%
#    layer_dense(32, input_shape = c(784)) %>%
#    layer_activation('relu') %>%
#    layer_dense(10) %>%
#    layer_activation('softmax') %>%
#    compile(
#      loss='binary_crossentropy',
#      optimizer = optimizer_sgd(),
#      metrics='accuracy'
#    )
#  
#  # fit with callbacks
#  model %>% fit(data, labels, callbacks = list(
#    callback_model_checkpoint("checkpoints.h5"),
#    callback_reduce_lr_on_plateau(monitor = "val_loss", factor = 0.1)
#  ))

## ------------------------------------------------------------------------
#  library(keras)
#  
#  # define custom callback class
#  LossHistory <- R6::R6Class("LossHistory",
#    inherit = KerasCallback,
#  
#    public = list(
#  
#      losses = NULL,
#  
#      on_batch_end = function(batch, logs = list()) {
#        self$losses <- c(self$losses, logs[["loss"]])
#      }
#  ))
#  
#  # define model
#  model <- keras_model_sequential()
#  
#  # add layers and compile
#  model %>%
#    layer_dense(units = 10, input_shape = c(784)) %>%
#    layer_activation(activation = 'softmax') %>%
#    compile(
#      loss = 'categorical_crossentropy',
#      optimizer = 'rmsprop'
#    )
#  
#  # create history callback object and use it during training
#  history <- LossHistory$new()
#  model %>% fit(
#    X_train, Y_train,
#    batch_size=128, epochs=20, verbose=0,
#    callbacks= list(history)
#  )
#  
#  # print the accumulated losses
#  history$losses

