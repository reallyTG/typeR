## ---- eval=T-------------------------------------------------------------

data(Boston, package = 'KernelKnn')

str(Boston)


## ---- eval=T-------------------------------------------------------------
X = scale(Boston[, -ncol(Boston)])
y = Boston[, ncol(Boston)]

# random split of data in train and test

spl_train = sample(1:length(y), round(length(y) * 0.75))
spl_test = setdiff(1:length(y), spl_train)
str(spl_train)
str(spl_test)


# evaluation metric

mse = function (y_true, y_pred) {
  
  out = mean((y_true - y_pred)^2)
  
  out
}


## ---- eval=T-------------------------------------------------------------

library(KernelKnn)

preds_TEST = KernelKnn(X[spl_train, ], TEST_data = X[spl_test, ], y[spl_train], k = 5 , 
                       
                       method = 'euclidean', weights_function = NULL, regression = T)
str(preds_TEST)


## ---- eval=T-------------------------------------------------------------


apply(Boston, 2, function(x) length(unique(x)))


tmp_bst = Boston
tmp_bst$chas = as.factor(tmp_bst$chas)
tmp_bst$rad = as.factor(tmp_bst$rad)

preds_TEST = KernelKnn(tmp_bst[spl_train, -ncol(tmp_bst)], 
                       
                       TEST_data = tmp_bst[spl_test, -ncol(tmp_bst)], 
                       
                       y[spl_train], k = 5 , method = 'euclidean', 
                       
                       regression = T, transf_categ_cols = T)
str(preds_TEST)


## ---- eval=T-------------------------------------------------------------


preds_TEST_biw = KernelKnn(X[spl_train, ], TEST_data = X[spl_test, ], y[spl_train], k = 5, 
                           
                           method = 'mahalanobis', weights_function = 'biweight', 
                           
                           regression = T, transf_categ_cols = F)
str(preds_TEST_biw)


## ---- eval=T-------------------------------------------------------------


norm_kernel = function(W) {
  
  W = dnorm(W, mean = 0, sd = 1.0)
  
  W = W / rowSums(W)
  
  return(W)
}


preds_TEST_norm = KernelKnn(X[spl_train, ], TEST_data = X[spl_test, ], y[spl_train], k = 5,
                            
                            method = 'mahalanobis', weights_function = norm_kernel, 
                            
                            regression = T, transf_categ_cols = F)
str(preds_TEST_norm)


## ---- eval = T, echo = F-------------------------------------------------

 knitr::kable(data.frame(k = c(9,3), method = c('mahalanobis', 'canberra'), kernel = c('triweight', 'cosine')))

## ---- eval=T, warning = FALSE, message = FALSE, results = 'hide'---------

fit_cv_pair1 = KernelKnnCV(X, y, k = 9, folds = 3, method = 'mahalanobis', 
                           
                           weights_function = 'triweight', regression = T, 
                           
                           threads = 5, seed_num = 3)

## ---- eval=T-------------------------------------------------------------
str(fit_cv_pair1)

## ---- eval=T, warning = FALSE, message = FALSE, results = 'hide'---------
fit_cv_pair2 = KernelKnnCV(X, y, k = 3, folds = 3, method = 'canberra',
                           
                           weights_function = 'cosine', regression = T, 
                           
                           threads = 5, seed_num = 3)

## ---- eval=T, warning = FALSE, message = FALSE, results = 'hide'---------
str(fit_cv_pair2)


## ---- eval=T-------------------------------------------------------------
mse_pair1 = unlist(lapply(1:length(fit_cv_pair1$preds), 
                          
                          function(x) mse(y[fit_cv_pair1$folds[[x]]], 
                                          
                                          fit_cv_pair1$preds[[x]])))
mse_pair1

cat('mse for params_pair1 is :', mean(mse_pair1), '\n')

mse_pair2 = unlist(lapply(1:length(fit_cv_pair2$preds), 
                          
                          function(x) mse(y[fit_cv_pair2$folds[[x]]], 
                                          
                                          fit_cv_pair2$preds[[x]])))
mse_pair2

cat('mse for params_pair2 is :', mean(mse_pair2), '\n')


## ---- eval = T, echo = F-------------------------------------------------

 knitr::kable(data.frame(k = c(19,18), method = c('mahalanobis', 'mahalanobis'), kernel = c('triangular_triweight_MULT', 'biweight_triweight_gaussian_MULT')))

## ---- eval=T, warning = FALSE, message = FALSE, results = 'hide'---------

fit_cv_pair1 = KernelKnnCV(X, y, k = 19, folds = 3, method = 'mahalanobis', 
                           
                           weights_function = 'triangular_triweight_MULT', 
                           
                           regression = T, threads = 5, seed_num = 3)

## ---- eval=T-------------------------------------------------------------
str(fit_cv_pair1)

## ---- eval=T, warning = FALSE, message = FALSE, results = 'hide'---------
fit_cv_pair2 = KernelKnnCV(X, y, k = 18, folds = 3, method = 'mahalanobis', 
                           
                           weights_function = 'biweight_triweight_gaussian_MULT', 
                           
                           regression = T, threads = 5, seed_num = 3)

## ---- eval=T-------------------------------------------------------------
str(fit_cv_pair2)


## ---- eval=T-------------------------------------------------------------
mse_pair1 = unlist(lapply(1:length(fit_cv_pair1$preds), 
                          
                          function(x) mse(y[fit_cv_pair1$folds[[x]]], 
                                          
                                          fit_cv_pair1$preds[[x]])))
mse_pair1

cat('mse for params_pair1 is :', mean(mse_pair1), '\n')

mse_pair2 = unlist(lapply(1:length(fit_cv_pair2$preds), 
                          
                          function(x) mse(y[fit_cv_pair2$folds[[x]]], 
                                          
                                          fit_cv_pair2$preds[[x]])))
mse_pair2

cat('mse for params_pair2 is :', mean(mse_pair2), '\n')


