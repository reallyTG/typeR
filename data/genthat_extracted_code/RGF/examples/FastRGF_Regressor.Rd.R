library(RGF)


### Name: FastRGF_Regressor
### Title: A Fast Regularized Greedy Forest regressor
### Aliases: FastRGF_Regressor
### Keywords: datasets

### ** Examples


if (reticulate::py_available() && reticulate::py_module_available("rgf.sklearn")) {

  library(RGF)

  set.seed(1)
  x = matrix(runif(100000), nrow = 100, ncol = 1000)

  y = runif(100)

  fast_RGF_regr = FastRGF_Regressor$new(max_leaf = 50)

  fast_RGF_regr$fit(x, y)

  preds = fast_RGF_regr$predict(x)
}



