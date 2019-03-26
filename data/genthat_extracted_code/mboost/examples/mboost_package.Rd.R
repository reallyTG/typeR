library(mboost)


### Name: mboost-package
### Title: mboost: Model-Based Boosting
### Aliases: mboost-package mboost_package package_mboost package-mboost
### Keywords: package smooth nonparametric models

### ** Examples

## No test: 
############################################################
## Do not run this example automatically as it takes
## some time (~ 5-10 seconds depending on the system)

  data("bodyfat", package = "TH.data")
  set.seed(290875)

  ### model conditional expectation of DEXfat given
  model <- mboost(DEXfat ~
      bols(age) +                 ### a linear function of age
      btree(hipcirc, waistcirc) + ### a smooth non-linear interaction of
                                  ### hip and waist circumference
      bbs(kneebreadth),           ### a smooth function of kneebreadth
      data = bodyfat, control = boost_control(mstop = 100))

  ### bootstrap for assessing `optimal' number of boosting iterations
  cvm <- cvrisk(model, papply = lapply)

  ### restrict model to mstop(cvm)
  model[mstop(cvm), return = FALSE]
  mstop(model)

  ### plot age and kneebreadth
  layout(matrix(1:2, nc = 2))
  plot(model, which = c("age", "kneebreadth"))

  ### plot interaction of hip and waist circumference
  attach(bodyfat)
  nd <- expand.grid(hipcirc = h <- seq(from = min(hipcirc),
                                  to = max(hipcirc),
                                  length = 100),
                    waistcirc = w <- seq(from = min(waistcirc),
                                  to = max(waistcirc),
                                  length = 100))
  plot(model, which = 2, newdata = nd)
  detach(bodyfat)

  ### customized plot
  layout(1)
  pr <- predict(model, which = "hip", newdata = nd)
  persp(x = h, y = w, z = matrix(pr, nrow = 100, ncol = 100))

## End(No test)



