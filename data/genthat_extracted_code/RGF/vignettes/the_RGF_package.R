## ---- eval = F, echo = T-------------------------------------------------
#  
#  library(RGF)
#  
#  # conversion from a matrix object to a scipy sparse matrix
#  #----------------------------------------------------------
#  
#  set.seed(1)
#  
#  x = matrix(runif(1000), nrow = 100, ncol = 10)
#  
#  x_sparse = mat_2scipy_sparse(x, format = "sparse_row_matrix")
#  
#  print(dim(x))
#  
#  [1] 100  10
#  
#  print(x_sparse$shape)
#  
#  (100, 10)
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  # conversion from a dgCMatrix object to a scipy sparse matrix
#  #-------------------------------------------------------------
#  
#  data = c(1, 0, 2, 0, 0, 3, 4, 5, 6)
#  
#  
#  # 'dgCMatrix' sparse matrix
#  #--------------------------
#  
#  dgcM = Matrix::Matrix(data = data, nrow = 3,
#  
#                        ncol = 3, byrow = TRUE,
#  
#                        sparse = TRUE)
#  
#  print(dim(dgcM))
#  
#  [1] 3 3
#  
#  x_sparse = TO_scipy_sparse(dgcM)
#  
#  print(x_sparse$shape)
#  
#  (3, 3)
#  
#  
#  # 'dgRMatrix' sparse matrix
#  #--------------------------
#  
#  dgrM = as(dgcM, "RsparseMatrix")
#  
#  class(dgrM)
#  
#  # [1] "dgRMatrix"
#  # attr(,"package")
#  # [1] "Matrix"
#  
#  print(dim(dgrM))
#  
#  [1] 3 3
#  
#  res_dgr = TO_scipy_sparse(dgrM)
#  
#  print(res_dgr$shape)
#  
#  (3, 3)
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  data(Boston, package = 'KernelKnn')
#  
#  library(RGF)
#  library(ranger)
#  library(xgboost)
#  
#  
#  
#  # shuffling function for cross-validation folds
#  #-----------------------------------------------
#  
#  
#  func_shuffle = function(vec, times = 10) {
#  
#    for (i in 1:times) {
#  
#      out = sample(vec, length(vec))
#    }
#    out
#  }
#  
#  
#  # cross-validation folds [ regression]
#  #-------------------------------------
#  
#  
#  regr_folds = function(folds, RESP, stratified = FALSE) {
#  
#    if (is.factor(RESP)) {
#  
#      stop(simpleError("This function is meant for regression.
#                       For classification use the 'class_folds' function."))
#    }
#  
#    samp_vec = rep(1/folds, folds)
#  
#    sort_names = paste0('fold_', 1:folds)
#  
#  
#    if (stratified == TRUE) {
#  
#      stratif = cut(RESP, breaks = folds)
#  
#      clas = lapply(unique(stratif), function(x) which(stratif == x))
#  
#      len = lapply(clas, function(x) length(x))
#  
#      prop = lapply(len, function(y) sapply(1:length(samp_vec), function(x)
#        round(y * samp_vec[x])))
#  
#      repl = unlist(lapply(prop, function(x) sapply(1:length(x), function(y)
#        rep(paste0('fold_', y), x[y]))))
#  
#      spl = suppressWarnings(split(1:length(RESP), repl))}
#  
#    else {
#  
#      prop = lapply(length(RESP), function(y) sapply(1:length(samp_vec),
#                                                     function(x) round(y * samp_vec[x])))
#  
#      repl = func_shuffle(unlist(lapply(prop, function(x)
#        sapply(1:length(x), function(y) rep(paste0('fold_', y), x[y])))))
#  
#      spl = suppressWarnings(split(1:length(RESP), repl))
#    }
#  
#    spl = spl[sort_names]
#  
#    if (length(table(unlist(lapply(spl, function(x) length(x))))) > 1) {
#  
#      warning('the folds are not equally split')
#    }
#  
#    if (length(unlist(spl)) != length(RESP)) {
#  
#      stop(simpleError("the length of the splits are not equal with the length
#                       of the response"))
#    }
#  
#    spl
#  }

## ---- eval = F, echo = T-------------------------------------------------
#  
#  NUM_FOLDS = 5
#  
#  set.seed(1)
#  FOLDS = regr_folds(folds = NUM_FOLDS, Boston[, 'medv'], stratified = T)
#  
#  
#  boston_rgf_te = boston_ranger_te = boston_xgb_te = boston_rgf_time =
#    boston_ranger_time = boston_xgb_time = rep(NA, NUM_FOLDS)
#  
#  
#  for (i in 1:length(FOLDS)) {
#  
#    cat("fold : ", i, "\n")
#  
#    samp = unlist(FOLDS[-i])
#    samp_ = unlist(FOLDS[i])
#  
#  
#    # RGF
#    #----
#  
#    rgf_start = Sys.time()
#  
#    init_regr = RGF_Regressor$new(l2 = 0.1)
#  
#    init_regr$fit(x = as.matrix(Boston[samp, -ncol(Boston)]), y = Boston[samp, ncol(Boston)])
#  
#    pr_te = init_regr$predict(as.matrix(Boston[samp_, -ncol(Boston)]))
#  
#    rgf_end = Sys.time()
#  
#    boston_rgf_time[i] = rgf_end - rgf_start
#  
#    boston_rgf_te[i] = MLmetrics::RMSE(Boston[samp_, 'medv'], pr_te)
#  
#  
#    # ranger
#    #-------
#  
#    ranger_start = Sys.time()
#  
#    fit = ranger(dependent.variable.name = "medv", data = Boston[samp, ], write.forest = TRUE,
#  
#                 probability = F, num.threads = 1, num.trees = 500, verbose = T,
#  
#                 classification = F, mtry = NULL, min.node.size = 5, keep.inbag = T)
#  
#    pred_te = predict(fit, data = Boston[samp_, -ncol(Boston)], type = 'se')$predictions
#  
#    ranger_end = Sys.time()
#  
#    boston_ranger_time[i] = ranger_end - ranger_start
#  
#    boston_ranger_te[i] = MLmetrics::RMSE(Boston[samp_, 'medv'], pred_te)
#  
#  
#    # xgboost
#    #--------
#  
#    xgb_start = Sys.time()
#  
#    dtrain <- xgb.DMatrix(data = as.matrix(Boston[samp, -ncol(Boston)]),
#  
#                          label = Boston[samp, ncol(Boston)])
#  
#    dtest <- xgb.DMatrix(data = as.matrix(Boston[samp_, -ncol(Boston)]),
#  
#                         label = Boston[samp_, ncol(Boston)])
#  
#  
#    watchlist <- list(train = dtrain, test = dtest)
#  
#  
#    param = list("objective" = "reg:linear", "bst:eta" = 0.05, "max_depth" = 4,
#  
#                 "subsample" = 0.85, "colsample_bytree" = 0.85, "booster" = "gbtree",
#  
#                 "nthread" = 1)
#  
#    fit = xgb.train(param, dtrain, nround = 500, print_every_n  = 100, watchlist = watchlist,
#  
#                    early_stopping_rounds = 20, maximize = FALSE, verbose = 0)
#  
#    p_te = xgboost:::predict.xgb.Booster(fit, as.matrix(Boston[samp_, -ncol(Boston)]),
#  
#                                         ntreelimit = fit$best_iteration)
#  
#    xgb_end = Sys.time()
#  
#    boston_xgb_time[i] = xgb_end - xgb_start
#  
#    boston_xgb_te[i] = MLmetrics::RMSE(Boston[samp_, 'medv'], p_te)
#  }
#  
#  
#  fold :  1
#  fold :  2
#  fold :  3
#  fold :  4
#  fold :  5
#  
#  
#  
#  cat("total time rgf 5 fold cross-validation : ", sum(boston_rgf_time),
#      " mean rmse on test data : ", mean(boston_rgf_te), "\n")
#  
#  cat("total time ranger 5 fold cross-validation : ", sum(boston_ranger_time),
#      " mean rmse on test data : ", mean(boston_ranger_te), "\n")
#  
#  cat("total time xgb 5 fold cross-validation : ", sum(boston_xgb_time),
#      " mean rmse on test data : ", mean(boston_xgb_te), "\n")
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  total time rgf 5 fold cross-validation :  0.7730639  mean rmse on test data :  3.832135
#  total time ranger 5 fold cross-validation :  3.826846  mean rmse on test data :  4.17419
#  total time xgb 5 fold cross-validation :  0.4316094  mean rmse on test data :  3.949122
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  # download the data from the following GitHub repository (tested on a Linux OS)
#  
#  system("wget
#         https://raw.githubusercontent.com/mlampros/DataSets/master/africa_soil_train_data.zip")
#  
#  
#  # load the data in the R session
#  
#  train_dat = read.table(unz("africa_soil_train_data.zip", "train.csv"), nrows = 1157,
#  
#                         header = T, quote = "\"", sep = ",")
#  
#  
#  # c("Ca", "P", "pH", "SOC", "Sand") : response variables
#  
#  
#  # exclude response-variables and factor variable
#  
#  x = train_dat[, -c(1, which(colnames(train_dat) %in%
#                                c("Ca", "P", "pH", "SOC", "Sand", "Depth")))]
#  
#  
#  # take (randomly) the first of the responses for train
#  
#  y = train_dat[, "Ca"]
#  
#  
#  # dataset for ranger
#  
#  tmp_rg_dat = cbind(Ca = y, x)
#  
#  
#  # cross-validation folds
#  
#  set.seed(2)
#  FOLDS = regr_folds(folds = NUM_FOLDS, y, stratified = T)
#  
#  
#  highdim_rgf_te = highdim_ranger_te = highdim_xgb_te = highdim_rgf_time =
#    highdim_ranger_time = highdim_xgb_time = rep(NA, NUM_FOLDS)
#  
#  
#  for (i in 1:length(FOLDS)) {
#  
#    cat("fold : ", i, "\n")
#  
#    new_samp = unlist(FOLDS[-i])
#    new_samp_ = unlist(FOLDS[i])
#  
#  
#    # RGF
#    #----
#  
#    rgf_start = Sys.time()
#  
#    init_regr = FastRGF_Regressor$new(n_jobs = 5, l2 = 0.1)       # added 'l2' regularization
#  
#    init_regr$fit(x = as.matrix(x[new_samp, ]), y = y[new_samp])
#  
#    pr_te = init_regr$predict(as.matrix(x[new_samp_, ]))
#  
#    rgf_end = Sys.time()
#  
#    highdim_rgf_time[i] = rgf_end - rgf_start
#  
#    highdim_rgf_te[i] = MLmetrics::RMSE(y[new_samp_], pr_te)
#  
#  
#    # ranger
#    #-------
#  
#    ranger_start = Sys.time()
#  
#  
#    fit = ranger(dependent.variable.name = "Ca", data = tmp_rg_dat[new_samp, ],
#  
#                 write.forest = TRUE, probability = F, num.threads = 5, num.trees = 500,
#  
#                 verbose = T, classification = F, mtry = NULL, min.node.size = 5,
#  
#                 keep.inbag = T)
#  
#  
#    pred_te = predict(fit, data = x[new_samp_, ], type = 'se')$predictions
#  
#    ranger_end = Sys.time()
#  
#    highdim_ranger_time[i] = ranger_end - ranger_start
#  
#    highdim_ranger_te[i] = MLmetrics::RMSE(y[new_samp_], pred_te)
#  
#  
#    # xgboost
#    #--------
#  
#    xgb_start = Sys.time()
#  
#    dtrain <- xgb.DMatrix(data = as.matrix(x[new_samp, ]), label = y[new_samp])
#  
#    dtest <- xgb.DMatrix(data = as.matrix(x[new_samp_, ]), label = y[new_samp_])
#  
#    watchlist <- list(train = dtrain, test = dtest)
#  
#    param = list("objective" = "reg:linear", "bst:eta" = 0.05, "max_depth" = 6,
#  
#                 "subsample" = 0.85, "colsample_bytree" = 0.85, "booster" = "gbtree",
#  
#                 "nthread" = 5)                        # "lambda" = 0.1 does not improve RMSE
#  
#    fit = xgb.train(param, dtrain, nround = 500, print_every_n  = 100, watchlist = watchlist,
#  
#                    early_stopping_rounds = 20, maximize = FALSE, verbose = 0)
#  
#    p_te = xgboost:::predict.xgb.Booster(fit, as.matrix(x[new_samp_, ]),
#                                         ntreelimit = fit$best_iteration)
#  
#    xgb_end = Sys.time()
#  
#    highdim_xgb_time[i] = xgb_end - xgb_start
#  
#    highdim_xgb_te[i] = MLmetrics::RMSE(y[new_samp_], p_te)
#  }
#  
#  
#  fold :  1
#  fold :  2
#  fold :  3
#  fold :  4
#  fold :  5
#  
#  
#  cat("total time rgf 5 fold cross-validation : ", sum(highdim_rgf_time),
#      " mean rmse on test data : ", mean(highdim_rgf_te), "\n")
#  
#  cat("total time ranger 5 fold cross-validation : ", sum(highdim_ranger_time),
#      " mean rmse on test data : ", mean(highdim_ranger_te), "\n")
#  
#  cat("total time xgb 5 fold cross-validation : ", sum(highdim_xgb_time),
#      " mean rmse on test data : ", mean(highdim_xgb_te), "\n")
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  total time rgf 5 fold cross-validation :  92.31971  mean rmse on test data :  0.5155166
#  total time ranger 5 fold cross-validation :  27.32866  mean rmse on test data :  0.5394164
#  total time xgb 5 fold cross-validation :  30.48834  mean rmse on test data :  0.5453544
#  

