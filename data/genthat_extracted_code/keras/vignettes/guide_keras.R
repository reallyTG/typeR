## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, eval = FALSE)

## ------------------------------------------------------------------------
#  library(keras)

## ------------------------------------------------------------------------
#  model <- keras_model_sequential()
#  
#  model %>%
#  
#    # Adds a densely-connected layer with 64 units to the model:
#    layer_dense(units = 64, activation = 'relu') %>%
#  
#    # Add another:
#    layer_dense(units = 64, activation = 'relu') %>%
#  
#    # Add a softmax layer with 10 output units:
#    layer_dense(units = 10, activation = 'softmax')

## ------------------------------------------------------------------------
#  # Create a sigmoid layer:
#  layer_dense(units = 64, activation ='sigmoid')
#  
#  # A linear layer with L1 regularization of factor 0.01 applied to the kernel matrix:
#  layer_dense(units = 64, kernel_regularizer = regularizer_l1(0.01))
#  
#  # A linear layer with L2 regularization of factor 0.01 applied to the bias vector:
#  layer_dense(units = 64, bias_regularizer = regularizer_l2(0.01))
#  
#  # A linear layer with a kernel initialized to a random orthogonal matrix:
#  layer_dense(units = 64, kernel_initializer = 'orthogonal')
#  
#  # A linear layer with a bias vector initialized to 2.0:
#  layer_dense(units = 64, bias_initializer = initializer_constant(2.0))

## ------------------------------------------------------------------------
#  model %>% compile(
#    optimizer = 'adam',
#    loss = 'categorical_crossentropy',
#    metrics = list('accuracy')
#  )

## ------------------------------------------------------------------------
#  # Configure a model for mean-squared error regression.
#  model %>% compile(
#    optimizer = 'adam',
#    loss = 'mse',           # mean squared error
#    metrics = list('mae')   # mean absolute error
#  )
#  
#  # Configure a model for categorical classification.
#  model %>% compile(
#    optimizer = optimizer_rmsprop(lr = 0.01),
#    loss = "categorical_crossentropy",
#    metrics = list("categorical_accuracy")
#  )

## ------------------------------------------------------------------------
#  
#  data <- matrix(rnorm(1000 * 32), nrow = 1000, ncol = 32)
#  labels <- matrix(rnorm(1000 * 10), nrow = 1000, ncol = 10)
#  
#  model %>% fit(
#    data,
#    labels,
#    epochs = 10,
#    batch_size = 32
#  )

## ------------------------------------------------------------------------
#  data <- matrix(rnorm(1000 * 32), nrow = 1000, ncol = 32)
#  labels <- matrix(rnorm(1000 * 10), nrow = 1000, ncol = 10)
#  
#  val_data <- matrix(rnorm(1000 * 32), nrow = 100, ncol = 32)
#  val_labels <- matrix(rnorm(100 * 10), nrow = 100, ncol = 10)
#  
#  model %>% fit(
#    data,
#    labels,
#    epochs = 10,
#    batch_size = 32,
#    validation_data = list(val_data, val_labels)
#  )

## ------------------------------------------------------------------------
#  model %>% evaluate(test_data, test_labels, batch_size = 32)
#  
#  model %>% evaluate(test_dataset, steps = 30)

## ------------------------------------------------------------------------
#  model %>% predict(test_data, batch_size = 32)
#  
#  model %>% predict(test_dataset, steps = 30)

## ------------------------------------------------------------------------
#  inputs <- layer_input(shape = (32))  # Returns a placeholder tensor
#  
#  predictions <- inputs %>%
#    layer_dense(units = 64, activation = 'relu') %>%
#    layer_dense(units = 64, activation = 'relu') %>%
#    layer_dense(units = 10, activation = 'softmax')
#  
#  # Instantiate the model given inputs and outputs.
#  model <- keras_model(inputs = inputs, outputs = predictions)
#  
#  # The compile step specifies the training configuration.
#  model %>% compile(
#    optimizer = optimizer_rmsprop(lr = 0.001),
#    loss = 'categorical_crossentropy',
#    metrics = list('accuracy')
#  )
#  
#  # Trains for 5 epochs
#  model %>% fit(
#    data,
#    labels,
#    batch_size = 32,
#    epochs = 5
#  )

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

## ------------------------------------------------------------------------
#  model <- keras_model_sequential()
#  model %>%
#    layer_dense(units = 32, input_shape = c(32,32)) %>%
#    layer_custom(output_dim = 32)

## ------------------------------------------------------------------------
#  my_model <- function(input_dim, output_dim, name = NULL) {
#  
#    # define and return a custom model
#    keras_model_custom(name = name, function(self) {
#  
#      # create layers we'll need for the call (this code executes once)
#      # note: the layers have to be created on the self object!
#      self$dense1 <- layer_dense(units = 64, activation = 'relu', input_shape = input_dim)
#      self$dense2 <- layer_dense(units = 64, activation = 'relu')
#      self$dense3 <- layer_dense(units = 10, activation = 'softmax')
#  
#      # implement call (this code executes during training & inference)
#      function(inputs, mask = NULL) {
#        x <- inputs %>%
#          self$dense1() %>%
#          self$dense2() %>%
#          self$dense3()
#        x
#      }
#    })
#  }
#  
#  model <- my_model(input_dim = 32, output_dim = 10)
#  
#  model %>% compile(
#    optimizer = optimizer_rmsprop(lr = 0.001),
#    loss = 'categorical_crossentropy',
#    metrics = list('accuracy')
#  )
#  
#  # Trains for 5 epochs
#  model %>% fit(
#    data,
#    labels,
#    batch_size = 32,
#    epochs = 5
#  )

## ------------------------------------------------------------------------
#  callbacks <- list(
#    callback_early_stopping(patience = 2, monitor = 'val_loss'),
#    callback_tensorboard(log_dir = './logs')
#  )
#  
#  model %>% fit(
#    data,
#    labels,
#    batch_size = 32,
#    epochs = 5,
#    callbacks = callbacks,
#    validation_data = list(val_data, val_labels)
#  )

## ------------------------------------------------------------------------
#  # save in HDF5 format
#  model %>% save_model_weights_hdf5('my_model.h5')
#  
#  # Restore the model's state,
#  # this requires a model with the same architecture.
#  model %>% load_model_weights_hdf5('my_model.h5')

## ------------------------------------------------------------------------
#  # Serialize a model to JSON format
#  json_string <- model %>% model_to_json()
#  
#  # Recreate the model (freshly initialized)
#  fresh_model <- model_from_json(json_string)
#  
#  # Serializes a model to YAML format
#  yaml_string <- model %>% model_to_yaml()
#  
#  # Recreate the model
#  fresh_model <- model_from_yaml(yaml_string)

## ------------------------------------------------------------------------
#  # Save entire model to a HDF5 file
#  model %>% save_model_hdf5('my_model.h5')
#  
#  # Recreate the exact same model, including weights and optimizer.
#  model <- load_model_hdf5('my_model.h5')

## ------------------------------------------------------------------------
#  library(keras)
#  use_implementation("tensorflow")

## ------------------------------------------------------------------------
#  install.packages("tfestimators")

## ------------------------------------------------------------------------
#  library(keras)
#  use_implementation("tensorflow")
#  library(tfestimators)
#  
#  estimator <- keras_model_to_estimator(model)

