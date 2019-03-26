library(RGF)


### Name: FastRGF_Classifier
### Title: A Fast Regularized Greedy Forest classifier
### Aliases: FastRGF_Classifier
### Keywords: datasets

### ** Examples


if (reticulate::py_available() && reticulate::py_module_available("rgf.sklearn")) {

  library(RGF)

  set.seed(1)
  x = matrix(runif(100000), nrow = 100, ncol = 1000)

  y = sample(1:2, 100, replace = TRUE)

  fast_RGF_class = FastRGF_Classifier$new(max_leaf = 50)

  fast_RGF_class$fit(x, y)

  preds = fast_RGF_class$predict_proba(x)
}



