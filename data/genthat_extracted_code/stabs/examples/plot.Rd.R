library(stabs)


### Name: plot.stabsel
### Title: Plot and Print Methods for Stability Selection
### Aliases: plot plot.stabsel print.stabsel
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
      plot(stab.lasso, ymargin = 6)
      opar <- par(mai = par("mai") * c(1, 1, 1, 2.7))
      plot(stab.lasso, type = "paths")
  }



