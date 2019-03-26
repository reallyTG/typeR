## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
knitr::opts_chunk$set(eval = FALSE)

## ------------------------------------------------------------------------
#  set.seed(123)
#  train_idx <- sample(nrow(iris), nrow(iris) * 2/3)
#  
#  iris_train <- iris[train_idx,]
#  iris_validation <- iris[-train_idx,]
#  iris_sample <- iris_train %>%
#    head(10)
#  
#  write.csv(iris_train, "iris_train.csv", row.names = FALSE)
#  write.csv(iris_validation, "iris_validation.csv", row.names = FALSE)
#  write.csv(iris_sample, "iris_sample.csv", row.names = FALSE)

## ------------------------------------------------------------------------
#  library(tfestimators)
#  response <- "Species"
#  features <- setdiff(names(iris), response)
#  feature_columns <- feature_columns(
#    column_numeric(features)
#  )
#  
#  classifier <- dnn_classifier(
#    feature_columns = feature_columns,
#    hidden_units = c(16, 32, 16),
#    n_classes = 3,
#    label_vocabulary = c("setosa", "virginica", "versicolor")
#  )

## ------------------------------------------------------------------------
#  iris_input_fn <- function(data) {
#    input_fn(data, features = features, response = response)
#  }
#  
#  iris_spec <- csv_record_spec("iris_sample.csv")
#  iris_train <- text_line_dataset(
#    "iris_train.csv", record_spec = iris_spec) %>%
#    dataset_batch(10) %>%
#    dataset_repeat(10)
#  iris_validation <- text_line_dataset(
#    "iris_validation.csv", record_spec = iris_spec) %>%
#    dataset_batch(10) %>%
#    dataset_repeat(1)

## ------------------------------------------------------------------------
#  history <- train(classifier, input_fn = iris_input_fn(iris_train))
#  plot(history)
#  predictions <- predict(classifier, input_fn = iris_input_fn(iris_validation))
#  predictions
#  evaluation <- evaluate(classifier, input_fn = iris_input_fn(iris_validation))
#  evaluation

