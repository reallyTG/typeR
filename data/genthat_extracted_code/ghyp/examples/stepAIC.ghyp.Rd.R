library(ghyp)


### Name: stepAIC.ghyp
### Title: Perform a model selection based on the AIC
### Aliases: stepAIC.ghyp
### Keywords: utilities

### ** Examples


  data(indices)

  # Multivariate case:
  aic.mv <- stepAIC.ghyp(indices, dist = c("ghyp", "hyp", "t", "gauss"),
                         symmetric = NULL, control = list(maxit = 500),
                         silent = TRUE, nit = 500)

  summary(aic.mv$best.model)

  # Univariate case:
  aic.uv <- stepAIC.ghyp(indices[, "stock"], dist = c("ghyp", "NIG", "VG", "gauss"),
                         symmetric = TRUE, control = list(maxit = 500), silent = TRUE)


  # Test whether the ghyp-model provides a significant improvement with
  # respect to the VG-model:
  lik.ratio.test(aic.uv$all.models[[1]], aic.uv$all.models[[3]])




