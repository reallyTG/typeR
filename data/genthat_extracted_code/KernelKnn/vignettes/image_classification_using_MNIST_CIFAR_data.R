## ---- eval = F, echo = T, warning = F, message = F, cache = T------------
#  
#  # using system('wget..') on a linux OS
#  
#  system("wget https://raw.githubusercontent.com/mlampros/DataSets/master/mnist.zip")
#  
#  mnist <- read.table(unz("mnist.zip", "mnist.csv"), nrows = 70000, header = T,
#  
#                      quote = "\"", sep = ",")
#  

## ---- eval = F, cache = T------------------------------------------------
#  X = mnist[, -ncol(mnist)]
#  dim(X)
#  
#  ## [1] 70000   784
#  
#  # the KernelKnn function requires that the labels are numeric and start from 1 : Inf
#  
#  y = mnist[, ncol(mnist)] + 1
#  table(y)
#  
#  ## y
#  ##    1    2    3    4    5    6    7    8    9   10
#  ## 6903 7877 6990 7141 6824 6313 6876 7293 6825 6958
#  

## ---- eval = T, echo = F-------------------------------------------------

 knitr::kable(data.frame(irlba_singlular_vectors = 40, k = 8, method = 'braycurtis', kernel = 'biweight_tricube_MULT'), align = 'l')

## ---- eval = F, cache = T------------------------------------------------
#  
#  library(irlba)
#  
#  svd_irlb = irlba(as.matrix(X), nv = 40, nu = 40, verbose = F)            # irlba truncated svd
#  
#  new_x = as.matrix(X) %*% svd_irlb$v               # new_x using the 40 right singular vectors
#  

## ---- eval = F, cache = T, warning = FALSE, message = FALSE, results = 'hide'----
#  
#  library(KernelKnn)
#  
#  fit = KernelKnnCV(as.matrix(new_x), y, k = 8, folds = 4, method = 'braycurtis',
#  
#                    weights_function = 'biweight_tricube_MULT', regression = F,
#  
#                    threads = 6, Levels = sort(unique(y)))
#  
#  
#  # str(fit)
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

## ---- eval = F, cache = F------------------------------------------------
#  
#  acc_fit = unlist(lapply(1:length(fit$preds),
#  
#                          function(x) acc(y[fit$folds[[x]]],
#  
#                                          fit$preds[[x]])))
#  acc_fit
#  
#  ## [1] 0.9742857 0.9749143 0.9761143 0.9741143
#  
#  cat('mean accuracy using cross-validation :', mean(acc_fit), '\n')
#  
#  ## mean accuracy using cross-validation : 0.9748571
#  

## ---- eval = F, cache = T------------------------------------------------
#  
#  library(OpenImageR)
#  
#  hog = HOG_apply(X, cells = 6, orientations = 9, rows = 28, columns = 28, threads = 6)
#  
#  ##
#  ## time to complete : 1.802997 secs
#  
#  dim(hog)
#  
#  ## [1] 70000   324
#  

## ---- eval = F, cache = T, warning = FALSE, message = FALSE, results = 'hide'----
#  
#  fit_hog = KernelKnnCV(hog, y, k = 20, folds = 4, method = 'braycurtis',
#  
#                    weights_function = 'biweight_tricube_MULT', regression = F,
#  
#                    threads = 6, Levels = sort(unique(y)))
#  
#  
#  #str(fit_hog)
#  

## ---- eval = F, cache = F------------------------------------------------
#  
#  acc_fit_hog = unlist(lapply(1:length(fit_hog$preds),
#  
#                              function(x) acc(y[fit_hog$folds[[x]]],
#  
#                                              fit_hog$preds[[x]])))
#  acc_fit_hog
#  
#  ## [1] 0.9833714 0.9840571 0.9846857 0.9838857
#  
#  cat('mean accuracy for hog-features using cross-validation :', mean(acc_fit_hog), '\n')
#  
#  ## mean accuracy for hog-features using cross-validation : 0.984
#  

## ---- eval = F, echo = T, warning = F, message = F, cache = T------------
#  
#  # using system('wget..') on a linux OS
#  
#  system("wget https://raw.githubusercontent.com/mlampros/DataSets/master/cifar_10.zip")
#  
#  cifar_10 <- read.table(unz("cifar_10.zip", "cifar_10.csv"), nrows = 60000, header = T,
#  
#                         quote = "\"", sep = ",")
#  

## ---- eval = F, cache = T------------------------------------------------
#  X = cifar_10[, -ncol(cifar_10)]
#  dim(X)
#  
#  ## [1] 60000  1024
#  
#  # the KernelKnn function requires that the labels are numeric and start from 1 : Inf
#  
#  y = cifar_10[, ncol(cifar_10)]
#  table(y)
#  
#  ## y
#  ##    1    2    3    4    5    6    7    8    9   10
#  ## 6000 6000 6000 6000 6000 6000 6000 6000 6000 6000
#  

## ---- eval = T, echo = F-------------------------------------------------

 knitr::kable(data.frame(irlba_singlular_vectors = 40, k = 8, method = 'braycurtis', 
                         
                         kernel = 'biweight_tricube_MULT'), align = 'l')

## ---- eval = F, cache = T------------------------------------------------
#  
#  svd_irlb = irlba(as.matrix(X), nv = 40, nu = 40, verbose = F)            # irlba truncated svd
#  
#  new_x = as.matrix(X) %*% svd_irlb$v               # new_x using the 40 right singular vectors
#  

## ---- eval = F, cache = T, warning = FALSE, message = FALSE, results = 'hide'----
#  
#  fit = KernelKnnCV(as.matrix(new_x), y, k = 8, folds = 4, method = 'braycurtis',
#  
#                    weights_function = 'biweight_tricube_MULT', regression = F,
#  
#                    threads = 6, Levels = sort(unique(y)))
#  
#  
#  # str(fit)
#  

## ---- eval = F, cache = F------------------------------------------------
#  
#  acc_fit = unlist(lapply(1:length(fit$preds),
#  
#                          function(x) acc(y[fit$folds[[x]]],
#  
#                                          fit$preds[[x]])))
#  acc_fit
#  
#  ## [1] 0.4080667 0.4097333 0.4040000 0.4102667
#  
#  cat('mean accuracy using cross-validation :', mean(acc_fit), '\n')
#  
#  ## mean accuracy using cross-validation : 0.4080167
#  

## ---- eval = F, cache = T------------------------------------------------
#  
#  hog = HOG_apply(X, cells = 6, orientations = 9, rows = 32,
#  
#                  columns = 32, threads = 6)
#  
#  ##
#  ## time to complete : 3.394621 secs
#  
#  dim(hog)
#  
#  ## [1] 60000   324
#  

## ---- eval = F, cache = T, warning = FALSE, message = FALSE, results = 'hide'----
#  
#  fit_hog = KernelKnnCV(hog, y, k = 20, folds = 4, method = 'braycurtis',
#  
#                    weights_function = 'biweight_tricube_MULT', regression = F,
#  
#                    threads = 6, Levels = sort(unique(y)))
#  
#  
#  # str(fit_hog)
#  

## ---- eval = F, cache = F------------------------------------------------
#  
#  acc_fit_hog = unlist(lapply(1:length(fit_hog$preds),
#  
#                              function(x) acc(y[fit_hog$folds[[x]]],
#  
#                                              fit_hog$preds[[x]])))
#  acc_fit_hog
#  
#  ## [1] 0.5807333 0.5884000 0.5777333 0.5861333
#  
#  cat('mean accuracy for hog-features using cross-validation :', mean(acc_fit_hog), '\n')
#  
#  ## mean accuracy for hog-features using cross-validation : 0.58325
#  

## ---- eval = F, echo = F-------------------------------------------------
#  
#  # remove cache and mnist.zip once vignettes are built
#  
#  # unlink("image_classification_using_MNIST_CIFAR_data_cache", recursive = TRUE)                    # USE this chunk in case of 'eval = TRUE'
#  # unlink("mnist.zip", recursive = TRUE)
#  # unlink("cifar_10.zip", recursive = TRUE)

