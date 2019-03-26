library(stabs)


### Name: stabsel
### Title: Stability Selection
### Aliases: stabsel stabsel.matrix stabsel.data.frame
### Keywords: nonparametric

### ** Examples

  
  if (require("TH.data")) {
      ## make data set available
      data("bodyfat", package = "TH.data")
  } else {
      ## simulate some data if TH.data not available. 
      ## Note that results are non-sense with this data.
      bodyfat <- matrix(rnorm(720), nrow = 72, ncol = 10)
  }
  
  ## set seed
  set.seed(1234)
  
  ####################################################################
  ### using stability selection with Lasso methods:

  if (require("lars")) {
      (stab.lasso <- stabsel(x = bodyfat[, -2], y = bodyfat[,2],
                             fitfun = lars.lasso, cutoff = 0.75,
                             PFER = 1))
      (stab.stepwise <- stabsel(x = bodyfat[, -2], y = bodyfat[,2],
                                fitfun = lars.stepwise, cutoff = 0.75,
                                PFER = 1))
      par(mfrow = c(2, 1))
      plot(stab.lasso, main = "Lasso")
      plot(stab.stepwise, main = "Stepwise Selection")
      ## --> stepwise selection seems to be quite unstable even in this low
      ##     dimensional example!
  }

  ## set seed (again to make results comparable)
  set.seed(1234)
  if (require("glmnet")) {
      (stab.glmnet <- stabsel(x = bodyfat[, -2], y = bodyfat[,2],
                              fitfun = glmnet.lasso, cutoff = 0.75,
                              PFER = 1))
      par(mfrow = c(2, 1))
      plot(stab.glmnet, main = "Lasso (glmnet)")
      if (exists("stab.lasso"))
          plot(stab.lasso, main = "Lasso (lars)")    
  }
  
  
  ## Select variables with maximum coefficients based on lasso estimate
  
  set.seed(1234) # reset seed
  if (require("glmnet")) {
      ## use cross-validated lambda 
      lambda.min <- cv.glmnet(x = as.matrix(bodyfat[, -2]), y = bodyfat[,2])$lambda.min
      (stab.maxCoef <- stabsel(x = bodyfat[, -2], y = bodyfat[,2],
                               fitfun = glmnet.lasso_maxCoef, 
                               # specify additional parameters to fitfun
                               args.fitfun = list(lambda = lambda.min),
                               cutoff = 0.75, PFER = 1))
                               
      ## WARNING: Using a fixed penalty (lambda) is usually not permitted and 
      ##          not sensible. See ?fitfun for details.
      
      ## now compare standard lasso with "maximal parameter estimates" from lasso
      par(mfrow = c(2, 1))
      plot(stab.maxCoef, main = "Lasso (glmnet; Maximum Coefficients)")
      plot(stab.glmnet, main = "Lasso (glmnet)")
      ## --> very different results.
  }

  ####################################################################
  ### using stability selection directly on computed boosting models
  ### from mboost


  if (require("mboost")) {
      ### low-dimensional example
      mod <- glmboost(DEXfat ~ ., data = bodyfat)

      ## compute cutoff ahead of running stabsel to see if it is a sensible
      ## parameter choice.
      ##   p = ncol(bodyfat) - 1 (= Outcome) + 1 ( = Intercept)
      stabsel_parameters(q = 3, PFER = 1, p = ncol(bodyfat) - 1 + 1,
                         sampling.type = "MB")
      ## the same:
      stabsel(mod, q = 3, PFER = 1, sampling.type = "MB", eval = FALSE)

      ## No test: 
### Do not test the following code per default on CRAN as it takes some time to run:
      ## now run stability selection
      (sbody <- stabsel(mod, q = 3, PFER = 1, sampling.type = "MB"))
      opar <- par(mai = par("mai") * c(1, 1, 1, 2.7))
      plot(sbody)
      par(opar)
      plot(sbody, type = "maxsel", ymargin = 6)
      
## End(No test)
  }



