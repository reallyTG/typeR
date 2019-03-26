## ---- eval=FALSE---------------------------------------------------------
#  install.packages("sparsevar", repos = "http://cran.us.r-project.org")

## ---- eval=FALSE---------------------------------------------------------
#  install.packages("devtools", repos = "http://cran.us.r-project.org")
#  devtools::install_github("svazzole/sparsevar")

## ------------------------------------------------------------------------
library(sparsevar)

## ------------------------------------------------------------------------
plotVAR(sim, fit)

## ---- eval=FALSE---------------------------------------------------------
#  irf <- impulseResponse(fit)
#  eb <- errorBandsIRF(fit, irf)

## ---- eval=FALSE---------------------------------------------------------
#  results <- fitVAR(rets)

## ---- eval=FALSE---------------------------------------------------------
#  results <- fitVAR(rets, p = 3, penalty = "ENET", parallel = TRUE,
#                    ncores = 5, alpha = 0.95, type.measure = "mae",
#                    lambda = "lambda.1se")

## ---- eval = FALSE-------------------------------------------------------
#  irf <- impulseResponse(fit)
#  eb <- errorBandsIRF(fit, irf, verbose = FALSE)
#  plotIRFGrid(irf, eb, indexes = c(11,20))

## ---- eval=FALSE---------------------------------------------------------
#  sim <- simulateVAR(N = 100, nobs = 250, rho = 0.75, sparsity = 0.05, method = "normal")

