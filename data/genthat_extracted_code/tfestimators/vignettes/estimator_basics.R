## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, eval = FALSE)

## ------------------------------------------------------------------------
#  input <- input_fn(mtcars,
#                    features = c("drat", "mpg", "am"),
#                    response = "vs",
#                    batch_size = 128,
#                    epochs = 3)

## ------------------------------------------------------------------------
#  input <- input_fn(vs ~ drat + mpg + am, data = mtcars,
#                    batch_size = 128,
#                    epochs = 3)

## ------------------------------------------------------------------------
#  cols <- feature_columns(
#    column_numeric("drat"),
#    column_indicator("am")
#  )

## ------------------------------------------------------------------------
#  # construct feature columns
#  linear_feature_columns <- feature_columns(column_numeric("mpg"))
#  dnn_feature_columns <- feature_columns(column_numeric("drat"))
#  
#  # generate classifier
#  classifier <-
#  	dnn_linear_combined_classifier(
#  	  linear_feature_columns = linear_feature_columns,
#  	  dnn_feature_columns = dnn_feature_columns,
#  	  dnn_hidden_units = c(3, 3),
#  	  dnn_optimizer = "Adagrad"
#  	)

## ------------------------------------------------------------------------
#  classifier %>%
#    train(input_fn = input, steps = 2)

## ------------------------------------------------------------------------
#  predictions <- predict(classifier, input_fn = input)

## ------------------------------------------------------------------------
#  predictions <- predict(
#    classifier,
#    input_fn = input,
#    predict_keys = "probabilities")

## ------------------------------------------------------------------------
#  predictions <- predict(
#    classifier,
#    input_fn = input,
#    predict_keys = "logistic")

## ------------------------------------------------------------------------
#  saved_model_dir <- model_dir(classifier)

## ------------------------------------------------------------------------
#  library(tfestimators)
#  linear_feature_columns <- feature_columns(column_numeric("mpg"))
#  dnn_feature_columns <- feature_columns(column_numeric("drat"))
#  
#  loaded_model <-
#  	dnn_linear_combined_classifier(
#  	  linear_feature_columns = linear_feature_columns,
#  	  dnn_feature_columns = dnn_feature_columns,
#  	  dnn_hidden_units = c(3, 3),
#  	  dnn_optimizer = "Adagrad",
#  	  model_dir = saved_model_dir
#  	)
#  loaded_model

