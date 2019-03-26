library(RGF)


### Name: RGF_Classifier
### Title: Regularized Greedy Forest classifier
### Aliases: RGF_Classifier
### Keywords: datasets

### ** Examples


if (reticulate::py_available() && reticulate::py_module_available("rgf.sklearn")) {

  library(RGF)

  set.seed(1)
  x = matrix(runif(1000), nrow = 100, ncol = 10)

  y = sample(1:2, 100, replace = TRUE)

  RGF_class = RGF_Classifier$new(max_leaf = 50)

  RGF_class$fit(x, y)

  preds = RGF_class$predict_proba(x)
}



