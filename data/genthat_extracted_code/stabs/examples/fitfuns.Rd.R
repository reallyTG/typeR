library(stabs)


### Name: Fitting Functions
### Title: Fit Functions for Stability Selection
### Aliases: fitfun fitfuns glmnet.lasso glmnet.lasso_maxCoef lars.lasso
###   lars.stepwise
### Keywords: models nonlinear nonparametric

### ** Examples

  if (require("TH.data")) {
      ## make data set available
      data("bodyfat", package = "TH.data")
  } else {
      ## simulate some data if TH.data not available. 
      ## Note that results are non-sense with this data.
      bodyfat <- matrix(rnorm(720), nrow = 72, ncol = 10)
  }
  
  if (require("lars")) {
      ## selected variables
      lars.lasso(bodyfat[, -2], bodyfat[,2], q = 3)$selected
      lars.stepwise(bodyfat[, -2], bodyfat[,2], q = 3)$selected
  }
  
  if (require("glmnet")) {
      glmnet.lasso(bodyfat[, -2], bodyfat[,2], q = 3)$selected
      ## selection path
      glmnet.lasso(bodyfat[, -2], bodyfat[,2], q = 3)$path
  
      ## Using the anticonservative glmnet.lasso (see args.fitfun):
      stab.glmnet <- stabsel(x = bodyfat[, -2], y = bodyfat[,2],
                             fitfun = glmnet.lasso, 
                             args.fitfun = list(type = "anticonservative"), 
                             cutoff = 0.75, PFER = 1)
  }



