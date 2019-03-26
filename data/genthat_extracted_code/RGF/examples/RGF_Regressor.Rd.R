library(RGF)


### Name: RGF_Regressor
### Title: Regularized Greedy Forest regressor
### Aliases: RGF_Regressor
### Keywords: datasets

### ** Examples


if (reticulate::py_available() && reticulate::py_module_available("rgf.sklearn")) {

  library(RGF)

  set.seed(1)
  x = matrix(runif(1000), nrow = 100, ncol = 10)

  y = runif(100)

  RGF_regr = RGF_Regressor$new(max_leaf = 50)

  RGF_regr$fit(x, y)

  preds = RGF_regr$predict(x)
}



