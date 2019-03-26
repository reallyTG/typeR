## ----setup, include=FALSE------------------------------------------------
library(keras)
knitr::opts_chunk$set(eval = FALSE)

## ------------------------------------------------------------------------
#  library(keras)
#  
#  model <- keras_model_sequential()
#  model %>%
#    layer_dense(units = 32, input_shape = c(784)) %>%
#    layer_activation('relu') %>%
#    layer_dense(units = 10) %>%
#    layer_activation('softmax')

## ------------------------------------------------------------------------
#  summary(model)

## ------------------------------------------------------------------------
#  # For a multi-class classification problem
#  model <- keras_model_sequential()
#  model %>%
#    layer_dense(units = 32, input_shape = c(784)) %>%
#    layer_activation('relu') %>%
#    layer_dense(units = 10) %>%
#    layer_activation('softmax')
#  
#  model %>% compile(
#    optimizer = 'rmsprop',
#    loss = 'categorical_crossentropy',
#    metrics = c('accuracy')
#  )

## ------------------------------------------------------------------------
#  model %>% compile(
#    optimizer = optimizer_rmsprop(lr = 0.002),
#    loss = 'mse'
#  )

## ------------------------------------------------------------------------
#  model %>% compile(
#    optimizer = optimizer_rmsprop(),
#    loss = loss_binary_crossentropy,
#    metrics = metric_binary_accuracy
#  )

## ------------------------------------------------------------------------
#  # create metric using backend tensor functions
#  metric_mean_pred <- custom_metric("mean_pred", function(y_true, y_pred) {
#    k_mean(y_pred)
#  })
#  
#  model %>% compile(
#    optimizer = optimizer_rmsprop(),
#    loss = loss_binary_crossentropy,
#    metrics = c('accuracy', metric_mean_pred)
#  )

## ------------------------------------------------------------------------
#  # create model
#  model <- keras_model_sequential()
#  
#  # add layers and compile the model
#  model %>%
#    layer_dense(units = 32, activation = 'relu', input_shape = c(100)) %>%
#    layer_dense(units = 1, activation = 'sigmoid') %>%
#    compile(
#      optimizer = 'rmsprop',
#      loss = 'binary_crossentropy',
#      metrics = c('accuracy')
#    )
#  
#  # Generate dummy data
#  data <- matrix(runif(1000*100), nrow = 1000, ncol = 100)
#  labels <- matrix(round(runif(1000, min = 0, max = 1)), nrow = 1000, ncol = 1)
#  
#  # Train the model, iterating on the data in batches of 32 samples
#  model %>% fit(data, labels, epochs=10, batch_size=32)

## ------------------------------------------------------------------------
#  # create model
#  model <- keras_model_sequential()
#  
#  # define and compile the model
#  model %>%
#    layer_dense(units = 32, activation = 'relu', input_shape = c(100)) %>%
#    layer_dense(units = 10, activation = 'softmax') %>%
#    compile(
#      optimizer = 'rmsprop',
#      loss = 'categorical_crossentropy',
#      metrics = c('accuracy')
#    )
#  
#  # Generate dummy data
#  data <- matrix(runif(1000*100), nrow = 1000, ncol = 100)
#  labels <- matrix(round(runif(1000, min = 0, max = 9)), nrow = 1000, ncol = 1)
#  
#  # Convert labels to categorical one-hot encoding
#  one_hot_labels <- to_categorical(labels, num_classes = 10)
#  
#  # Train the model, iterating on the data in batches of 32 samples
#  model %>% fit(data, one_hot_labels, epochs=10, batch_size=32)

## ------------------------------------------------------------------------
#  library(keras)
#  
#  # generate dummy data
#  x_train <- matrix(runif(1000*20), nrow = 1000, ncol = 20)
#  
#  y_train <- runif(1000, min = 0, max = 9) %>%
#    round() %>%
#    matrix(nrow = 1000, ncol = 1) %>%
#    to_categorical(num_classes = 10)
#  
#  x_test  <- matrix(runif(100*20), nrow = 100, ncol = 20)
#  
#  y_test <- runif(100, min = 0, max = 9) %>%
#    round() %>%
#    matrix(nrow = 100, ncol = 1) %>%
#    to_categorical(num_classes = 10)
#  
#  # create model
#  model <- keras_model_sequential()
#  
#  # define and compile the model
#  model %>%
#    layer_dense(units = 64, activation = 'relu', input_shape = c(20)) %>%
#    layer_dropout(rate = 0.5) %>%
#    layer_dense(units = 64, activation = 'relu') %>%
#    layer_dropout(rate = 0.5) %>%
#    layer_dense(units = 10, activation = 'softmax') %>%
#    compile(
#      loss = 'categorical_crossentropy',
#      optimizer = optimizer_sgd(lr = 0.01, decay = 1e-6, momentum = 0.9, nesterov = TRUE),
#      metrics = c('accuracy')
#    )
#  
#  # train
#  model %>% fit(x_train, y_train, epochs = 20, batch_size = 128)
#  
#  # evaluate
#  score <- model %>% evaluate(x_test, y_test, batch_size = 128)

## ------------------------------------------------------------------------
#  library(keras)
#  
#  # generate dummy data
#  x_train <- matrix(runif(1000*20), nrow = 1000, ncol = 20)
#  y_train <- matrix(round(runif(1000, min = 0, max = 1)), nrow = 1000, ncol = 1)
#  x_test <- matrix(runif(100*20), nrow = 100, ncol = 20)
#  y_test <- matrix(round(runif(100, min = 0, max = 1)), nrow = 100, ncol = 1)
#  
#  # create model
#  model <- keras_model_sequential()
#  
#  # define and compile the model
#  model %>%
#    layer_dense(units = 64, activation = 'relu', input_shape = c(20)) %>%
#    layer_dropout(rate = 0.5) %>%
#    layer_dense(units = 64, activation = 'relu') %>%
#    layer_dropout(rate = 0.5) %>%
#    layer_dense(units = 1, activation = 'sigmoid') %>%
#    compile(
#      loss = 'binary_crossentropy',
#      optimizer = 'rmsprop',
#      metrics = c('accuracy')
#    )
#  
#  # train
#  model %>% fit(x_train, y_train, epochs = 20, batch_size = 128)
#  
#  # evaluate
#  score = model %>% evaluate(x_test, y_test, batch_size=128)

## ------------------------------------------------------------------------
#  library(keras)
#  
#  # generate dummy data
#  x_train <- array(runif(100 * 100 * 100 * 3), dim = c(100, 100, 100, 3))
#  
#  y_train <- runif(100, min = 0, max = 9) %>%
#    round() %>%
#    matrix(nrow = 100, ncol = 1) %>%
#    to_categorical(num_classes = 10)
#  
#  x_test <- array(runif(20 * 100 * 100 * 3), dim = c(20, 100, 100, 3))
#  
#  y_test <- runif(20, min = 0, max = 9) %>%
#    round() %>%
#    matrix(nrow = 20, ncol = 1) %>%
#    to_categorical(num_classes = 10)
#  
#  # create model
#  model <- keras_model_sequential()
#  
#  # define and compile model
#  # input: 100x100 images with 3 channels -> (100, 100, 3) tensors.
#  # this applies 32 convolution filters of size 3x3 each.
#  model %>%
#    layer_conv_2d(filters = 32, kernel_size = c(3,3), activation = 'relu',
#                  input_shape = c(100,100,3)) %>%
#    layer_conv_2d(filters = 32, kernel_size = c(3,3), activation = 'relu') %>%
#    layer_max_pooling_2d(pool_size = c(2,2)) %>%
#    layer_dropout(rate = 0.25) %>%
#    layer_conv_2d(filters = 64, kernel_size = c(3,3), activation = 'relu') %>%
#    layer_conv_2d(filters = 64, kernel_size = c(3,3), activation = 'relu') %>%
#    layer_max_pooling_2d(pool_size = c(2,2)) %>%
#    layer_dropout(rate = 0.25) %>%
#    layer_flatten() %>%
#    layer_dense(units = 256, activation = 'relu') %>%
#    layer_dropout(rate = 0.25) %>%
#    layer_dense(units = 10, activation = 'softmax') %>%
#    compile(
#      loss = 'categorical_crossentropy',
#      optimizer = optimizer_sgd(lr = 0.01, decay = 1e-6, momentum = 0.9, nesterov = TRUE)
#    )
#  
#  # train
#  model %>% fit(x_train, y_train, batch_size = 32, epochs = 10)
#  
#  # evaluate
#  score <- model %>% evaluate(x_test, y_test, batch_size = 32)

## ---- eval = FALSE-------------------------------------------------------
#  model <- keras_model_sequential()
#  model %>%
#    layer_embedding(input_dim = max_features, output_dim - 256) %>%
#    layer_lstm(units = 128) %>%
#    layer_dropout(rate = 0.5) %>%
#    layer_dense(units = 1, activation = 'sigmoid') %>%
#    compile(
#      loss = 'binary_crossentropy',
#      optimizer = 'rmsprop',
#      metrics = c('accuracy')
#    )
#  
#  model %>% fit(x_train, y_train, batch_size = 16, epochs = 10)
#  score <- model %>% evaluate(x_test, y_test, batch_size = 16)

## ---- eval=FALSE---------------------------------------------------------
#  model <- keras_model_sequential()
#  model %>%
#    layer_conv_1d(filters = 64, kernel_size = 3, activation = 'relu',
#                  input_shape = c(seq_length, 100)) %>%
#    layer_conv_1d(filters = 64, kernel_size = 3, activation = 'relu') %>%
#    layer_max_pooling_1d(pool_size = 3) %>%
#    layer_conv_1d(filters = 128, kernel_size = 3, activation = 'relu') %>%
#    layer_conv_1d(filters = 128, kernel_size = 3, activation = 'relu') %>%
#    layer_global_average_pooling_1d() %>%
#    layer_dropout(rate = 0.5) %>%
#    layer_dense(units = 1, activation = 'sigmoid') %>%
#    compile(
#      loss = 'binary_crossentropy',
#      optimizer = 'rmsprop',
#      metrics = c('accuracy')
#    )
#  
#  model %>% fit(x_train, y_train, batch_size = 16, epochs = 10)
#  score <- model %>% evaluate(x_test, y_test, batch_size = 16)

## ------------------------------------------------------------------------
#  library(keras)
#  
#  # constants
#  data_dim <- 16
#  timesteps <- 8
#  num_classes <- 10
#  
#  # define and compile model
#  # expected input data shape: (batch_size, timesteps, data_dim)
#  model <- keras_model_sequential()
#  model %>%
#    layer_lstm(units = 32, return_sequences = TRUE, input_shape = c(timesteps, data_dim)) %>%
#    layer_lstm(units = 32, return_sequences = TRUE) %>%
#    layer_lstm(units = 32) %>% # return a single vector dimension 32
#    layer_dense(units = 10, activation = 'softmax') %>%
#    compile(
#      loss = 'categorical_crossentropy',
#      optimizer = 'rmsprop',
#      metrics = c('accuracy')
#    )
#  
#  # generate dummy training data
#  x_train <- array(runif(1000 * timesteps * data_dim), dim = c(1000, timesteps, data_dim))
#  y_train <- matrix(runif(1000 * num_classes), nrow = 1000, ncol = num_classes)
#  
#  # generate dummy validation data
#  x_val <- array(runif(100 * timesteps * data_dim), dim = c(100, timesteps, data_dim))
#  y_val <- matrix(runif(100 * num_classes), nrow = 100, ncol = num_classes)
#  
#  # train
#  model %>% fit(
#    x_train, y_train, batch_size = 64, epochs = 5, validation_data = list(x_val, y_val)
#  )

## ------------------------------------------------------------------------
#  library(keras)
#  
#  # constants
#  data_dim <- 16
#  timesteps <- 8
#  num_classes <- 10
#  batch_size <- 32
#  
#  # define and compile model
#  # Expected input batch shape: (batch_size, timesteps, data_dim)
#  # Note that we have to provide the full batch_input_shape since the network is stateful.
#  # the sample of index i in batch k is the follow-up for the sample i in batch k-1.
#  model <- keras_model_sequential()
#  model %>%
#    layer_lstm(units = 32, return_sequences = TRUE, stateful = TRUE,
#               batch_input_shape = c(batch_size, timesteps, data_dim)) %>%
#    layer_lstm(units = 32, return_sequences = TRUE, stateful = TRUE) %>%
#    layer_lstm(units = 32, stateful = TRUE) %>%
#    layer_dense(units = 10, activation = 'softmax') %>%
#    compile(
#      loss = 'categorical_crossentropy',
#      optimizer = 'rmsprop',
#      metrics = c('accuracy')
#    )
#  
#  # generate dummy training data
#  x_train <- array(runif( (batch_size * 10) * timesteps * data_dim),
#                   dim = c(batch_size * 10, timesteps, data_dim))
#  y_train <- matrix(runif( (batch_size * 10) * num_classes),
#                    nrow = batch_size * 10, ncol = num_classes)
#  
#  # generate dummy validation data
#  x_val <- array(runif( (batch_size * 3) * timesteps * data_dim),
#                 dim = c(batch_size * 3, timesteps, data_dim))
#  y_val <- matrix(runif( (batch_size * 3) * num_classes),
#                  nrow = batch_size * 3, ncol = num_classes)
#  
#  # train
#  model %>% fit(
#    x_train,
#    y_train,
#    batch_size = batch_size,
#    epochs = 5,
#    shuffle = FALSE,
#    validation_data = list(x_val, y_val)
#  )

