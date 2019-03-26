## ----setup, include = FALSE----------------------------------------------
library(keras)
knitr::opts_chunk$set(comment = NA, eval = FALSE)

## ------------------------------------------------------------------------
#  model %>% compile(
#    loss = 'categorical_crossentropy',
#    optimizer = optimizer_rmsprop(),
#    metrics = c('accuracy')
#  )
#  
#  history <- model %>% fit(
#    x_train, y_train,
#    epochs = 30, batch_size = 128,
#    validation_split = 0.2
#  )

## ------------------------------------------------------------------------
#  plot(history)

## ------------------------------------------------------------------------
#  history_df <- as.data.frame(history)
#  str(history_df)

## ------------------------------------------------------------------------
#  # don't show metrics during this run
#  history <- model %>% fit(
#    x_train, y_train,
#    epochs = 30, batch_size = 128,
#    view_metrics = FALSE,
#    validation_split = 0.2
#  )
#  
#  # set global default to never show metrics
#  options(keras.view_metrics = FALSE)

## ------------------------------------------------------------------------
#  history <- model %>% fit(
#    x_train, y_train,
#    batch_size = batch_size,
#    epochs = epochs,
#    verbose = 1,
#    callbacks = callback_tensorboard("logs/run_a"),
#    validation_split = 0.2
#  )

## ------------------------------------------------------------------------
#  tensorboard("logs/run_a")

## ------------------------------------------------------------------------
#  # launch TensorBoard (data won't show up until after the first epoch)
#  tensorboard("logs/run_a")
#  
#  # fit the model with the TensorBoard callback
#  history <- model %>% fit(
#    x_train, y_train,
#    batch_size = batch_size,
#    epochs = epochs,
#    verbose = 1,
#    callbacks = callback_tensorboard("logs/run_a"),
#    validation_split = 0.2
#  )

## ------------------------------------------------------------------------
#  callback_tensorboard(log_dir = "logs/run_b")

## ------------------------------------------------------------------------
#  tensorboard("logs")

## ------------------------------------------------------------------------
#  tensorboard(c("logs/run_a", "logs/run_b"))

