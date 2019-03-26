## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, eval = FALSE)

## ------------------------------------------------------------------------
#  library(keras)

## ------------------------------------------------------------------------
#  boston_housing <- dataset_boston_housing()
#  
#  c(train_data, train_labels) %<-% boston_housing$train
#  c(test_data, test_labels) %<-% boston_housing$test

## ------------------------------------------------------------------------
#  paste0("Training entries: ", length(train_data), ", labels: ", length(train_labels))

## ------------------------------------------------------------------------
#  train_data[1, ] # Display sample features, notice the different scales

## ------------------------------------------------------------------------
#  library(tibble)
#  
#  column_names <- c('CRIM', 'ZN', 'INDUS', 'CHAS', 'NOX', 'RM', 'AGE',
#                    'DIS', 'RAD', 'TAX', 'PTRATIO', 'B', 'LSTAT')
#  train_df <- as_tibble(train_data)
#  colnames(train_df) <- column_names
#  
#  train_df

## ------------------------------------------------------------------------
#  train_labels[1:10] # Display first 10 entries
#  

## ------------------------------------------------------------------------
#  # Test data is *not* used when calculating the mean and std.
#  
#  # Normalize training data
#  train_data <- scale(train_data)
#  
#  # Use means and standard deviations from training set to normalize test set
#  col_means_train <- attr(train_data, "scaled:center")
#  col_stddevs_train <- attr(train_data, "scaled:scale")
#  test_data <- scale(test_data, center = col_means_train, scale = col_stddevs_train)
#  
#  train_data[1, ] # First training sample, normalized

## ------------------------------------------------------------------------
#  build_model <- function() {
#  
#    model <- keras_model_sequential() %>%
#      layer_dense(units = 64, activation = "relu",
#                  input_shape = dim(train_data)[2]) %>%
#      layer_dense(units = 64, activation = "relu") %>%
#      layer_dense(units = 1)
#  
#    model %>% compile(
#      loss = "mse",
#      optimizer = optimizer_rmsprop(),
#      metrics = list("mean_absolute_error")
#    )
#  
#    model
#  }
#  
#  model <- build_model()
#  model %>% summary()

## ------------------------------------------------------------------------
#  # Display training progress by printing a single dot for each completed epoch.
#  print_dot_callback <- callback_lambda(
#    on_epoch_end = function(epoch, logs) {
#      if (epoch %% 80 == 0) cat("\n")
#      cat(".")
#    }
#  )
#  
#  epochs <- 500
#  
#  # Fit the model and store training stats
#  history <- model %>% fit(
#    train_data,
#    train_labels,
#    epochs = epochs,
#    validation_split = 0.2,
#    verbose = 0,
#    callbacks = list(print_dot_callback)
#  )
#  
#  

## ------------------------------------------------------------------------
#  library(ggplot2)
#  
#  plot(history, metrics = "mean_absolute_error", smooth = FALSE) +
#    coord_cartesian(ylim = c(0, 5))

## ------------------------------------------------------------------------
#  # The patience parameter is the amount of epochs to check for improvement.
#  early_stop <- callback_early_stopping(monitor = "val_loss", patience = 20)
#  
#  model <- build_model()
#  history <- model %>% fit(
#    train_data,
#    train_labels,
#    epochs = epochs,
#    validation_split = 0.2,
#    verbose = 0,
#    callbacks = list(early_stop, print_dot_callback)
#  )
#  
#  plot(history, metrics = "mean_absolute_error", smooth = FALSE) +
#    coord_cartesian(xlim = c(0, 150), ylim = c(0, 5))

## ------------------------------------------------------------------------
#  c(loss, mae) %<-% (model %>% evaluate(test_data, test_labels, verbose = 0))
#  
#  paste0("Mean absolute error on test set: $", sprintf("%.2f", mae * 1000))

## ------------------------------------------------------------------------
#  test_predictions <- model %>% predict(test_data)
#  test_predictions[ , 1]

