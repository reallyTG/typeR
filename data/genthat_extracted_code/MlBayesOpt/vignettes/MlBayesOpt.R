## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE,
                      collapse = TRUE,
                      comment = "#>",
                      message = FALSE)

## ----eval=FALSE----------------------------------------------------------
#  library(xgboost)
#  library(Matrix)
#  
#  data(agaricus.train, package = "xgboost")
#  dtrain <- xgb.DMatrix(agaricus.train$data,
#                        label = agaricus.train$label)
#  cv_folds <- KFold(agaricus.train$label, nfolds = 5,
#                    stratified = TRUE, seed = 0)
#  xgb_cv_bayes <- function(max_depth, min_child_weight, subsample) {
#    cv <- xgb.cv(params = list(booster = "gbtree", eta = 0.01,
#                               max_depth = max_depth,
#                               min_child_weight = min_child_weight,
#                               subsample = subsample, colsample_bytree = 0.3,
#                               lambda = 1, alpha = 0,
#                               objective = "binary:logistic",
#                               eval_metric = "auc"),
#                 data = dtrain, nround = 100,
#                 folds = cv_folds, prediction = TRUE, showsd = TRUE,
#                 early_stopping_rounds = 5, maximize = TRUE, verbose = 0)
#    list(Score = cv$evaluation_log$test_auc_mean[cv$best_iteration],
#         Pred = cv$pred)
#  }
#  OPT_Res <- BayesianOptimization(xgb_cv_bayes,
#                                  bounds = list(max.depth = c(2L, 6L),
#                                                min_child_weight = c(1L, 10L),
#                                                subsample = c(0.5, 0.8)),
#                                  init_grid_dt = NULL, init_points = 10, n_iter = 20,
#                                  acq = "ucb", kappa = 2.576, eps = 0.0,
#                                  verbose = TRUE)

## ----eval=FALSE----------------------------------------------------------
#  library(MlBayesOpt)
#  
#  res0 <- xgb_cv_opt(data = agaricus.train$data,
#                     label = agaricus.train$label,
#                     objectfun = "binary:logistic",
#                     evalmetric = "auc",
#                     n_folds = 5,
#                     acq = "ucb",
#                     init_points = 10,
#                     n_iter = 20)

## ----eval=FALSE----------------------------------------------------------
#  # This takes a lot of time
#  # fashion data is included in this package
#  res0 <- xgb_cv_opt(data = fashion,
#                     label = y,
#                     objectfun = "multi:softmax",
#                     evalmetric = "merror",
#                     n_folds = 15,
#                     classes = 10)

## ----cran-installation, eval = FALSE-------------------------------------
#  install.packages("MlbayesOpt")

## ----gh-installation, eval = FALSE---------------------------------------
#  # install.packages("githubinstall")
#  githubinstall::githubinstall("MlBayesOpt")
#  
#  # install.packages("devtools")
#  devtools::install_github("ymattu/MlBayesOpt")

## ----eval=FALSE----------------------------------------------------------
#  library(MlBayesOpt)

## ----eval=FALSE----------------------------------------------------------
#  res0 <- svm_cv_opt(data = fashion_train,
#                     label = y,
#                     svm_kernel = "polynomial",
#                     degree_range = c(2L, 4L),
#                     n_folds = 3,
#                     kappa = 5,
#                     init_points = 4,
#                     n_iter = 5)

## ----eval=FALSE----------------------------------------------------------
#  res0 <- rf_opt(train_data = fashion_train,
#                 train_label = y,
#                 test_data = fashion_test,
#                 test_label = y,
#                 mtry_range = c(1L, ncol(fashion_train)-1),
#                 num_tree = 10L,
#                 init_points = 4,
#                 n_iter = 5)

## ----eval=FALSE----------------------------------------------------------
#  res0 <- xgb_cv_opt(data = fashion_train,
#                     label = y,
#                     objectfun = "multi:softmax",
#                     evalmetric = "merror",
#                     n_folds = 3,
#                     classes = 10,
#                     init_points = 4,
#                     n_iter = 5)

