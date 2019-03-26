## ----setup, include=FALSE------------------------------------------------
library(tfestimators)
knitr::opts_chunk$set(echo = TRUE)
knitr::opts_chunk$set(eval = FALSE)

## ------------------------------------------------------------------------
#  parsing_spec <- classifier_parse_example_spec(
#    feature_columns = column_numeric('a'),
#    label_key = 'b',
#    weight_column = 'c'
#  )

## ------------------------------------------------------------------------
#  expected_spec <- list(
#    a = tf$python$ops$parsing_ops$FixedLenFeature(reticulate::tuple(1L), dtype = tf$float32),
#    c = tf$python$ops$parsing_ops$FixedLenFeature(reticulate::tuple(1L), dtype = tf$float32),
#    b = tf$python$ops$parsing_ops$FixedLenFeature(reticulate::tuple(1L), dtype = tf$int64)
#  )
#  
#  # This should be the same as the one we constructed using `classifier_parse_example_spec`
#  testthat::expect_equal(parsing_spec, expected_spec)

## ------------------------------------------------------------------------
#  fcs <- feature_columns(...)
#  
#  model <- dnn_classifier(
#    n_classes = 1000,
#    feature_columns = fcs,
#    weight_column = 'example-weight',
#    label_vocabulary= c('photos', 'keep', ...),
#    hidden_units = c(256, 64, 16)
#  )

## ------------------------------------------------------------------------
#  parsing_spec <- classifier_parse_example_spec(
#    feature_columns = fcs,
#    label_key = 'my-label',
#    label_dtype = tf$string,
#    weight_column = 'example-weight'
#  )
#  

## ------------------------------------------------------------------------
#  input_fn_train <- function() {
#    features <- tf$contrib$learn$read_batch_features(
#      file_pattern = train_files,
#      batch_size = batch_size,
#      features = parsing_spec,
#      reader = tf$RecordIOReader)
#    labels <- features[["my-label"]]
#    return(list(features, labels))
#  }

## ------------------------------------------------------------------------
#  train(model, input_fn = input_fn_train)

