## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, eval = FALSE)

## ------------------------------------------------------------------------
#  library(keras)
#  
#  mnist <- dataset_mnist()
#  
#  c(train_images, train_labels) %<-% mnist$train
#  c(test_images, test_labels) %<-% mnist$test
#  
#  train_labels <- train_labels[1:1000]
#  test_labels <- test_labels[1:1000]
#  
#  train_images <- train_images[1:1000, , ] %>%
#    array_reshape(c(1000, 28 * 28))
#  train_images <- train_images / 255
#  
#  test_images <- test_images[1:1000, , ] %>%
#    array_reshape(c(1000, 28 * 28))
#  test_images <- test_images / 255

## ------------------------------------------------------------------------
#  # Returns a short sequential model
#  create_model <- function() {
#    model <- keras_model_sequential() %>%
#      layer_dense(units = 512, activation = "relu", input_shape = 784) %>%
#      layer_dropout(0.2) %>%
#      layer_dense(units = 10, activation = "softmax")
#    model %>% compile(
#      optimizer = "adam",
#      loss = "sparse_categorical_crossentropy",
#      metrics = list("accuracy")
#    )
#    model
#  }
#  
#  model <- create_model()
#  model %>% summary()
#  

## ------------------------------------------------------------------------
#  model <- create_model()
#  
#  model %>% fit(train_images, train_labels, epochs = 5)
#  
#  model %>% save_model_hdf5("my_model.h5")

## ------------------------------------------------------------------------
#  model %>% save_model_weights_hdf5("my_model_weights.h5")

## ------------------------------------------------------------------------
#  new_model <- load_model_hdf5("my_model.h5")
#  new_model %>% summary()

## ------------------------------------------------------------------------
#  checkpoint_dir <- "checkpoints"
#  dir.create(checkpoint_dir, showWarnings = FALSE)
#  filepath <- file.path(checkpoint_dir, "weights.{epoch:02d}-{val_loss:.2f}.hdf5")
#  
#  # Create checkpoint callback
#  cp_callback <- callback_model_checkpoint(
#    filepath = filepath,
#    save_weights_only = TRUE,
#    verbose = 1
#  )
#  
#  model <- create_model()
#  
#  model %>% fit(
#    train_images,
#    train_labels,
#    epochs = 10,
#    validation_data = list(test_images, test_labels),
#    callbacks = list(cp_callback)  # pass callback to training
#  )

## ------------------------------------------------------------------------
#  list.files(checkpoint_dir)

## ------------------------------------------------------------------------
#  fresh_model <- create_model()
#  score <- fresh_model %>% evaluate(test_images, test_labels)
#  
#  cat('Test loss:', score$loss, '\n')
#  cat('Test accuracy:', score$acc, '\n')

## ------------------------------------------------------------------------
#  fresh_model %>% load_model_weights_hdf5(
#    file.path(checkpoint_dir, "weights.10-0.42.hdf5")
#  )
#  score <- fresh_model %>% evaluate(test_images, test_labels)
#  
#  cat('Test loss:', score$loss, '\n')
#  cat('Test accuracy:', score$acc, '\n')

## ------------------------------------------------------------------------
#  checkpoint_dir <- "checkpoints"
#  unlink(checkpoint_dir, recursive = TRUE)
#  dir.create(checkpoint_dir)
#  filepath <- file.path(checkpoint_dir, "weights.{epoch:02d}-{val_loss:.2f}.hdf5")
#  
#  # Create checkpoint callback
#  cp_callback <- callback_model_checkpoint(
#    filepath = filepath,
#    save_weights_only = TRUE,
#    period = 5,
#    verbose = 1
#  )
#  
#  model <- create_model()
#  
#  model %>% fit(
#    train_images,
#    train_labels,
#    epochs = 10,
#    validation_data = list(test_images, test_labels),
#    callbacks = list(cp_callback)  # pass callback to training
#  )
#  
#  list.files(checkpoint_dir)

## ------------------------------------------------------------------------
#  checkpoint_dir <- "checkpoints"
#  unlink(checkpoint_dir, recursive = TRUE)
#  dir.create(checkpoint_dir)
#  filepath <- file.path(checkpoint_dir, "weights.{epoch:02d}-{val_loss:.2f}.hdf5")
#  
#  # Create checkpoint callback
#  cp_callback <- callback_model_checkpoint(
#    filepath = filepath,
#    save_weights_only = TRUE,
#    save_best_only = TRUE,
#    verbose = 1
#  )
#  
#  model <- create_model()
#  
#  model %>% fit(
#    train_images,
#    train_labels,
#    epochs = 10,
#    validation_data = list(test_images, test_labels),
#    callbacks = list(cp_callback)  # pass callback to training
#  )
#  
#  list.files(checkpoint_dir)

