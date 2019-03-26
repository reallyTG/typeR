library(mboost)


### Name: mboost_fit
### Title: Model-based Gradient Boosting
### Aliases: mboost_fit
### Keywords: models nonlinear

### ** Examples

  data("bodyfat", package = "TH.data")

  ### formula interface: additive Gaussian model with
  ### a non-linear step-function in `age', a linear function in `waistcirc'
  ### and a smooth non-linear smooth function in `hipcirc'
  mod <- mboost(DEXfat ~ btree(age) + bols(waistcirc) + bbs(hipcirc),
                data = bodyfat)
  layout(matrix(1:6, nc = 3, byrow = TRUE))
  plot(mod, main = "formula")

  ### the same
  with(bodyfat,
       mod <- mboost_fit(list(btree(age), bols(waistcirc), bbs(hipcirc)),
                         response = DEXfat))
  plot(mod, main = "base-learner")



