## ---- eval = FALSE-------------------------------------------------------
#  library(devtools)
#  devtools::install_github("h2oai/h2o4gpu", subdir = "src/interface_r")

## ---- eval = FALSE-------------------------------------------------------
#  library(reticulate)
#  use_virtualenv("/home/ledell/venv/h2o4gpu")  # set this to the path of your venv

## ---- eval = FALSE-------------------------------------------------------
#  library(h2o4gpu)
#  library(reticulate)  # only needed if using a virtual Python environment
#  use_virtualenv("/home/ledell/venv/h2o4gpu")  # set this to the path of your venv
#  
#  # Prepare data
#  x <- iris[1:4]
#  y <- as.integer(iris$Species) # all columns, including the response, must be numeric
#  
#  # Initialize and train the classifier
#  model <- h2o4gpu.random_forest_classifier() %>% fit(x, y)
#  
#  # Make predictions
#  pred <- model %>% predict(x)
#  
#  # Compute classification error using the Metrics package (note this is training error)
#  library(Metrics)
#  ce(actual = y, predicted = pred)

## ---- eval = FALSE-------------------------------------------------------
#  # Load a sample dataset for binary classification
#  # Source: https://archive.ics.uci.edu/ml/datasets/HIGGS
#  train <- read.csv("https://s3.amazonaws.com/erin-data/higgs/higgs_train_10k.csv")
#  test <- read.csv("https://s3.amazonaws.com/erin-data/higgs/higgs_test_5k.csv")
#  
#  # Create train & test sets (column 1 is the response)
#  x_train <- train[, -1]
#  y_train <- train[, 1]
#  x_test <- test[, -1]
#  y_test <- test[, 1]

## ---- eval = FALSE-------------------------------------------------------
#  # Train three different binary classification models
#  model_gbc <- h2o4gpu.gradient_boosting_classifier() %>% fit(x_train, y_train)
#  model_rfc <- h2o4gpu.random_forest_classifier() %>% fit(x_train, y_train)
#  model_enc <- h2o4gpu.elastic_net_classifier() %>% fit(x_train, y_train)

## ---- eval = FALSE-------------------------------------------------------
#  # Generate predictions (type "prob" gives predicted values instead of predicted label)
#  pred_gbc <- model_gbc %>% predict(x_test, type = "prob")
#  pred_rfc <- model_rfc %>% predict(x_test, type = "prob")
#  pred_enc <- model_enc %>% predict(x_test, type = "prob")

## ---- eval = FALSE-------------------------------------------------------
#  head(pred_rfc)

## ---- eval = FALSE-------------------------------------------------------
#  # Compare test set performance using AUC
#  auc(actual = y_test, predicted = pred_gbc[, 2])
#  auc(actual = y_test, predicted = pred_rfc[, 2])
#  auc(actual = y_test, predicted = pred_enc[, 2])

## ---- eval = FALSE-------------------------------------------------------
#  # Load a sample dataset for regression
#  # Source: https://archive.ics.uci.edu/ml/datasets/Abalone
#  df <- read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/abalone/abalone.data", header = FALSE)
#  str(df)

## ---- eval = FALSE-------------------------------------------------------
#  df[, 1] <- as.integer(df[, 1])  #label encode the one factor column

## ---- eval = FALSE-------------------------------------------------------
#  # Randomly sample 80% of the rows for the training set
#  set.seed(1)
#  train_idx <- sample(1:nrow(df), 0.8*nrow(df))
#  
#  # Create train & test sets (column 9 is the response)
#  x_train <- df[train_idx, -9]
#  y_train <- df[train_idx, 9]
#  x_test <- df[-train_idx, -9]
#  y_test <- df[-train_idx, 9]

## ---- eval = FALSE-------------------------------------------------------
#  # Train two different regression models
#  model_gbr <- h2o4gpu.gradient_boosting_regressor() %>% fit(x_train, y_train)
#  model_enr <- h2o4gpu.elastic_net_regressor() %>% fit(x_train, y_train)
#  
#  # Generate predictions
#  pred_gbr <- model_gbr %>% predict(x_test)
#  pred_enr <- model_enr %>% predict(x_test)

## ---- eval = FALSE-------------------------------------------------------
#  head(pred_gbr)

## ---- eval = FALSE-------------------------------------------------------
#  # Compare test set performance using MSE
#  mse(actual = y_test, predicted = pred_gbr)
#  mse(actual = y_test, predicted = pred_enr)

## ---- eval = FALSE-------------------------------------------------------
#  # Prepare data
#  iris$Species <- as.integer(iris$Species) # convert to numeric data
#  
#  # Randomly sample 80% of the rows for the training set
#  set.seed(1)
#  train_idx <- sample(1:nrow(iris), 0.8*nrow(iris))
#  train <- iris[train_idx, ]
#  test <- iris[-train_idx, ]

## ---- eval = FALSE-------------------------------------------------------
#  model_km <- h2o4gpu.kmeans(n_clusters = 3L) %>% fit(train)

## ---- eval = FALSE-------------------------------------------------------
#  test_dist <- model_km %>% transform(test)
#  head(test_dist)

## ---- eval = FALSE-------------------------------------------------------
#  # Load a sample dataset for binary classification
#  # Source: https://archive.ics.uci.edu/ml/datasets/HIGGS
#  train <- read.csv("https://s3.amazonaws.com/erin-data/higgs/higgs_train_10k.csv")
#  test <- read.csv("https://s3.amazonaws.com/erin-data/higgs/higgs_test_5k.csv")

## ---- eval = FALSE-------------------------------------------------------
#  model_pca <- h2o4gpu.pca(n_components = 4) %>% fit(train)
#  test_transformed <- model_pca %>% transform(test)

## ---- eval = FALSE-------------------------------------------------------
#  model_tsvd <- h2o4gpu.truncated_svd(n_components = 4) %>% fit(train)
#  test_transformed <- model_tsvd %>% transform(test)

