library(ghyp)


### Name: logLik-AIC-methods
### Title: Extract Log-Likelihood and Akaike's Information Criterion
### Aliases: logLik.mle.ghyp logLik,mle.ghyp-method AIC.mle.ghyp
###   AIC,mle.ghyp-method
### Keywords: utilities methods

### ** Examples

  data(smi.stocks)

  ## Multivariate fit
  fit.mv <- fit.hypmv(smi.stocks, nit = 10)
  AIC(fit.mv)
  logLik(fit.mv)

  ## Univariate fit
  fit.uv <- fit.tuv(smi.stocks[, "CS"], control = list(maxit = 10))
  AIC(fit.uv)
  logLik(fit.uv)

  # Both together
  AIC(fit.uv, fit.mv)
  logLik(fit.uv, fit.mv)



