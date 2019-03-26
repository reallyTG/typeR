library(stabs)


### Name: stabsel.stabsel
### Title: Change Parameters of Stability Selection
### Aliases: stabsel.stabsel
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

      par(mfrow = c(2, 1))
      plot(stab.lasso)

      ## now change the PFER and the assumption:
      (stab.lasso_cf0.93_rconc <- stabsel(stab.lasso, cutoff = 0.93,
                                          assumption = "r-concave"))
      plot(stab.lasso_cf0.93_rconc)
      ## the cutoff did change and hence the PFER and the selected
      ## variables
  }



