## ----setup, include=FALSE------------------------------------------------
library(keras)
knitr::opts_chunk$set(eval = FALSE)

## ---- eval= FALSE--------------------------------------------------------
#  # Replicates `model` on 8 GPUs.
#  # This assumes that your machine has 8 available GPUs.
#  parallel_model <- multi_gpu_model(model, gpus=8)
#  parallel_model %>% compile(
#    loss = "categorical_crossentropy",
#    optimizer = "rmsprop"
#  )
#  
#  # This `fit` call will be distributed on 8 GPUs.
#  # Since the batch size is 256, each GPU will process 32 samples.
#  parallel_model %>% fit(x, y, epochs = 20, batch_size = 256)

## ---- eval = FALSE-------------------------------------------------------
#  # Model where a shared LSTM is used to encode two different sequences in parallel
#  input_a <- layer_input(shape = c(140, 256))
#  input_b <- layer_input(shape = c(140, 256))
#  
#  shared_lstm <- layer_lstm(units = 64)
#  
#  # Process the first sequence on one GPU
#  library(tensorflow)
#  with(tf$device_scope("/gpu:0", {
#    encoded_a <- shared_lstm(tweet_a)
#  }):
#  
#  # Process the next sequence on another GPU
#  with(tf$device_scope("/gpu:1", {
#    encoded_b <- shared_lstm(tweet_b)
#  }):
#  
#  # Concatenate results on CPU
#  with(tf$device_scope("/cpu:0", {
#    merged_vector <- layer_concatenate(list(encoded_a, encoded_b))
#  }):

## ------------------------------------------------------------------------
#  model %>%
#    layer_dense(units = 32, activation = 'relu', input_shape = c(784)) %>%
#    layer_dense(units = 10, activation = 'softmax')

## ------------------------------------------------------------------------
#  model <- model %>%
#    layer_dense(units = 32, activation = 'relu', input_shape = c(784)) %>%
#    layer_dense(units = 10, activation = 'softmax')

## ------------------------------------------------------------------------
#  save_model_hdf5(model, 'my_model.h5')
#  model <- load_model_hdf5('my_model.h5')

## ------------------------------------------------------------------------
#  json_string <- model_to_json(model)
#  yaml_string <- model_to_yaml(model)

## ------------------------------------------------------------------------
#  model <- model_from_json(json_string)
#  model <- model_from_yaml(yaml_string)

## ------------------------------------------------------------------------
#  save_model_weights_hdf5('my_model_weights.h5')

## ------------------------------------------------------------------------
#  model %>% load_model_weights_hdf5('my_model_weights.h5')

## ------------------------------------------------------------------------
#  model %>% load_model_weights_hdf5('my_model_weights.h5', by_name = TRUE)

## ------------------------------------------------------------------------
#  # assuming the original model looks like this:
#  #   model <- keras_model_sequential()
#  #   model %>%
#  #     layer_dense(units = 2, input_dim = 3, name = "dense 1") %>%
#  #     layer_dense(units = 3, name = "dense_3") %>%
#  #     ...
#  #   save_model_weights(model, fname)
#  
#  # new model
#  model <- keras_model_sequential()
#  model %>%
#    layer_dense(units = 2, input_dim = 3, name = "dense 1") %>%  # will be loaded
#    layer_dense(units = 3, name = "dense_3")                     # will not be loaded
#  
#  # load weights from first model; will only affect the first layer, dense_1.
#  load_model_weights(fname, by_name = TRUE)

## ------------------------------------------------------------------------
#  model <- ...  # create the original model
#  
#  layer_name <- 'my_layer'
#  intermediate_layer_model <- keras_model(inputs = model$input,
#                                          outputs = get_layer(model, layer_name)$output)
#  intermediate_output <- predict(intermediate_layer_model, data)

## ------------------------------------------------------------------------
#  sampling_generator <- function(X_data, Y_data, batch_size) {
#    function() {
#      rows <- sample(1:nrow(X_data), batch_size, replace = TRUE)
#      list(X_data[rows,], Y_data[rows,])
#    }
#  }
#  
#  model %>%
#    fit_generator(sampling_generator(X_train, Y_train, batch_size = 128),
#                  steps_per_epoch = nrow(X_train) / 128, epochs = 10)
#  

## ------------------------------------------------------------------------
#  data_files_generator <- function(dir) {
#  
#    files < list.files(dir)
#    next_file <- 0
#  
#    function() {
#  
#      # move to the next file (note the <<- assignment operator)
#      next_file <<- next_file + 1
#  
#      # if we've exhausted all of the files then start again at the
#      # beginning of the list (keras generators need to yield
#      # data infinitely -- termination is controlled by the epochs
#      # and steps_per_epoch arguments to fit_generator())
#      if (next_file > length(files))
#        next_file <<- 1
#  
#      # determine the file name
#      file <- files[[next_file]]
#  
#      # process and return the data in the file. note that in a
#      # real example you'd further subdivide the data within the
#      # file into appropriately sized training batches. this
#      # would make this function much more complicated so we
#      # don't demonstrated it here
#      file_to_training_data(file)
#    }
#  }

## ------------------------------------------------------------------------
#  early_stopping <- callback_early_stopping(monitor = 'val_loss', patience = 2)
#  model %>% fit(X, y, validation_split = 0.2, callbacks = c(early_stopping))

## ------------------------------------------------------------------------
#  hist <- model %>% fit(X, y, validation_split=0.2)
#  hist$history

## ------------------------------------------------------------------------
#  frozen_layer <- layer_dense(units = 32, trainable = FALSE)

## ------------------------------------------------------------------------
#  x <- layer_input(shape = c(32))
#  layer <- layer_dense(units = 32)
#  layer$trainable <- FALSE
#  y <- x %>% layer
#  
#  frozen_model <- keras_model(x, y)
#  # in the model below, the weights of `layer` will not be updated during training
#  frozen_model %>% compile(optimizer = 'rmsprop', loss = 'mse')
#  
#  layer$trainable <- TRUE
#  trainable_model <- keras_model(x, y)
#  # with this model the weights of the layer will be updated during training
#  # (which will also affect the above model since it uses the same layer instance)
#  trainable_model %>% compile(optimizer = 'rmsprop', loss = 'mse')
#  
#  frozen_model %>% fit(data, labels)  # this does NOT update the weights of `layer`
#  trainable_model %>% fit(data, labels)  # this updates the weights of `layer`

## ------------------------------------------------------------------------
#  # instantiate a VGG16 model
#  conv_base <- application_vgg16(
#    weights = "imagenet",
#    include_top = FALSE,
#    input_shape = c(150, 150, 3)
#  )
#  
#  # freeze it's weights
#  freeze_weights(conv_base)
#  
#  # create a composite model that includes the base + more layers
#  model <- keras_model_sequential() %>%
#    conv_base %>%
#    layer_flatten() %>%
#    layer_dense(units = 256, activation = "relu") %>%
#    layer_dense(units = 1, activation = "sigmoid")
#  
#  # compile
#  model %>% compile(
#    loss = "binary_crossentropy",
#    optimizer = optimizer_rmsprop(lr = 2e-5),
#    metrics = c("accuracy")
#  )
#  
#  # unfreeze weights from "block5_conv1" on
#  unfreeze_weights(conv_base, from = "block5_conv1")
#  
#  # compile again since we froze or unfroze layers
#  model %>% compile(
#    loss = "binary_crossentropy",
#    optimizer = optimizer_rmsprop(lr = 2e-5),
#    metrics = c("accuracy")
#  )

## ------------------------------------------------------------------------
#  model <- keras_model_sequential()
#  model %>%
#    layer_dense(units = 32, activation = 'relu', input_shape = c(784)) %>%
#    layer_dense(units = 32, activation = 'relu') %>%
#    layer_dense(units = 32, activation = 'relu')
#  
#  length(model$layers)     # "3"
#  model %>% pop_layer()
#  length(model$layers)     # "2"

## ------------------------------------------------------------------------
#  model <- application_vgg16(weights = 'imagenet', include_top = TRUE)

## ------------------------------------------------------------------------
#  library(keras)
#  use_backend("plaidml")

## ------------------------------------------------------------------------
#  library(keras)
#  use_condaenv("plaidml")
#  use_backend("plaidml")

## ------------------------------------------------------------------------
#  # testthat utilty for skipping tests when Keras isn't available
#  skip_if_no_keras <- function(version = NULL) {
#    if (!is_keras_available(version))
#      skip("Required keras version not available for testing")
#  }
#  
#  # use the function within a test
#  test_that("keras function works correctly", {
#    skip_if_no_keras()
#    # test code here
#  })

## ------------------------------------------------------------------------
#  # Keras python module
#  keras <- NULL
#  
#  # Obtain a reference to the module from the keras R package
#  .onLoad <- function(libname, pkgname) {
#    keras <<- keras::implementation()
#  }

## ------------------------------------------------------------------------
#  library(keras)
#  use_session_with_seed(42)
#  
#  # ...rest of code follows...
#  

## ------------------------------------------------------------------------
#  library(keras)
#  use_session_with_seed(42, disable_gpu = FALSE, disable_parallel_cpu = FALSE)

