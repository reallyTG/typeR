## ---- eval = F, echo = T-------------------------------------------------
#  
#  library(nmslibR)
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
#  
#  library(nmslibR)
#  
#  
#  # download the data from my Github repository (tested on a Linux OS)
#  #-------------------------------------------------------------------
#  
#  system("wget https://raw.githubusercontent.com/mlampros/DataSets/master/sift_10k.txt")
#  
#  
#  # load the data in the R session
#  #-------------------------------
#  
#  sift_10k = read.table("~/sift_10k.txt", quote="\"", comment.char="")
#  
#  
#  # index parameters
#  #-----------------
#  
#  M = 15
#  efC = 100
#  num_threads = 5
#  
#  index_params = list('M'= M, 'indexThreadQty' = num_threads, 'efConstruction' = efC,
#  
#                      'post' = 0, 'skip_optimized_index' = 1 )
#  
#  
#  # query-time parameters
#  #----------------------
#  
#  efS = 100
#  
#  query_time_params = list('efSearch' = efS)
#  
#  
#  # Number of neighbors
#  #--------------------
#  
#  K = 100
#  
#  
#  # space to use
#  #---------------
#  
#  space_name = 'l2sqr_sift'
#  
#  
#  # initialize NMSlib [ the data should be a matrix ]
#  #--------------------------------------------------
#  
#  init_nms = NMSlib$new(input_data = as.matrix(sift_10k), Index_Params = index_params,
#  
#                        Time_Params = query_time_params, space = space_name,
#  
#                        space_params = NULL, method = 'hnsw',
#  
#                        data_type = 'DENSE_UINT8_VECTOR', dtype = 'INT',
#  
#                        index_filepath = NULL, print_progress = FALSE)
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  # returns a 1-dimensional vector
#  #-------------------------------
#  
#  init_nms$Knn_Query(query_data_row = as.matrix(sift_10k[1, ]), k = 5)
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  [[1]]
#  [1]    2    6 4585 9256  140                    # indices
#  
#  [[2]]
#  [1] 18724 24320 68158 69067 70321               # distances
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  # returns knn's for all data
#  #---------------------------
#  
#  all_dat = init_nms$knn_Query_Batch(as.matrix(sift_10k), k = 5, num_threads = 1)
#  
#  str(all_dat)
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  # a list of indices and distances for all observations
#  #------------------------------------------------------
#  
#  List of 2
#   $ knn_idx : num [1:10000, 1:5] 3 4 1 2 13 14 1 2 30 31 ...
#   $ knn_dist: num [1:10000, 1:5] 18724 14995 18724 14995 21038 ...
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  # using system('wget..') on a linux OS
#  
#  system("wget https://raw.githubusercontent.com/mlampros/DataSets/master/mnist.zip")
#  
#  mnist <- read.table(unz("mnist.zip", "mnist.csv"), nrows = 70000, header = T,
#  
#                      quote = "\"", sep = ",")
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  X = mnist[, -ncol(mnist)]
#  dim(X)
#  
#  ## [1] 70000   784
#  
#  # the 'KernelKnnCV_nmslib' function requires that the labels are numeric and start from 1 : Inf
#  
#  y = mnist[, ncol(mnist)] + 1
#  table(y)
#  
#  ## y
#  ##    1    2    3    4    5    6    7    8    9   10
#  ## 6903 7877 6990 7141 6824 6313 6876 7293 6825 6958
#  
#  
#  # evaluation metric
#  
#  acc = function (y_true, preds) {
#  
#    out = table(y_true, max.col(preds, ties.method = "random"))
#  
#    acc = sum(diag(out))/sum(out)
#  
#    acc
#  }
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  library(OpenImageR)
#  
#  hog = HOG_apply(X, cells = 6, orientations = 9, rows = 28, columns = 28, threads = 6)
#  
#  ##
#  ## time to complete : 2.101281 secs
#  
#  dim(hog)
#  
#  ## [1] 70000   324
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  # parameters for 'KernelKnnCV_nmslib'
#  #------------------------------------
#  
#  M = 30
#  efC = 100
#  num_threads = 6
#  
#  index_params = list('M'= M, 'indexThreadQty' = num_threads, 'efConstruction' = efC,
#  
#                      'post' = 0, 'skip_optimized_index' = 1 )
#  
#  
#  efS = 100
#  
#  query_time_params = list('efSearch' = efS)
#  
#  
#  # approximate kernel knn
#  #-----------------------
#  
#  fit_hog = KernelKnnCV_nmslib(hog, y, k = 20, folds = 4, h = 1,
#                               weights_function = 'biweight_tricube_MULT',
#                               Levels = sort(unique(y)), Index_Params = index_params,
#                               Time_Params = query_time_params, space = "cosinesimil",
#                               space_params = NULL, method = "hnsw", data_type = "DENSE_VECTOR",
#                               dtype = "FLOAT", index_filepath = NULL, print_progress = FALSE,
#                               num_threads = 6, seed_num = 1)
#  
#  
#  # cross-validation starts ..
#  
#  # |=================================================================================| 100%
#  
#  # time to complete : 32.88805 secs
#  
#  
#  str(fit_hog)
#  
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  List of 2
#   $ preds:List of 4
#    ..$ : num [1:17500, 1:10] 0 0 0 0 0 0 0 0 0 0 ...
#    ..$ : num [1:17500, 1:10] 0 0 0 0 1 ...
#    ..$ : num [1:17500, 1:10] 0 0 0 0 0 ...
#    ..$ : num [1:17500, 1:10] 0 0 0 0 0 0 0 0 0 0 ...
#   $ folds:List of 4
#    ..$ fold_1: int [1:17500] 49808 21991 42918 7967 49782 28979 64440 49809 30522 36673 ...
#    ..$ fold_2: int [1:17500] 51122 9469 58021 45228 2944 58052 65074 17709 2532 31262 ...
#    ..$ fold_3: int [1:17500] 33205 40078 68177 32620 52721 18981 19417 53922 19102 67206 ...
#    ..$ fold_4: int [1:17500] 28267 41652 28514 34525 68534 13294 48759 47521 69395 41408 ...
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  acc_fit_hog = unlist(lapply(1:length(fit_hog$preds),
#  
#                              function(x) acc(y[fit_hog$folds[[x]]],
#  
#                                              fit_hog$preds[[x]])))
#  acc_fit_hog
#  
#  ## [1] 0.9768000 0.9786857 0.9763429 0.9760000
#  
#  cat('mean accuracy for hog-features using cross-validation :', mean(acc_fit_hog), '\n')
#  
#  ## mean accuracy for hog-features using cross-validation : 0.9769571
#  

## ---- eval = F, echo = T-------------------------------------------------
#  
#  
#  # brute force of NMSLIB   [ here we set 'Index_Params' and 'Time_Params' to NULL ]
#  #----------------------
#  
#  fit_hog_seq = KernelKnnCV_nmslib(hog, y, k = 20, folds = 4, h = 1,
#                                  weights_function = 'biweight_tricube_MULT',
#                                  Levels = sort(unique(y)), Index_Params = NULL,
#                                  Time_Params = NULL, space = "cosinesimil",
#                                  space_params = NULL, method = "seq_search",
#                                  data_type = "DENSE_VECTOR", dtype = "FLOAT",
#                                  index_filepath = NULL, print_progress = FALSE,
#                                  num_threads = 6, seed_num = 1)
#  
#  
#  # cross-validation starts ..
#  
#  # |=================================================================================| 100%
#  
#  # time to complete : 4.506177 mins
#  
#  
#  acc_fit_hog_seq = unlist(lapply(1:length(fit_hog_seq$preds),
#  
#                                  function(x) acc(y[fit_hog_seq$folds[[x]]],
#  
#                                                  fit_hog_seq$preds[[x]])))
#  acc_fit_hog_seq
#  
#  ## [1] 0.9785143 0.9802286 0.9783429 0.9784571
#  
#  cat('mean accuracy for hog-features using cross-validation :', mean(acc_fit_hog_seq), '\n')
#  
#  ## mean accuracy for hog-features using cross-validation : 0.9788857
#  
#  

