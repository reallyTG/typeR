library(dse)


### Name: estMaxLik
### Title: Maximum Likelihood Estimation
### Aliases: estMaxLik estMaxLik.TSdata estMaxLik.TSmodel
###   estMaxLik.TSestModel
### Keywords: ts

### ** Examples

  true.model <- ARMA(A=c(1, 0.5), B=1)
  est.model <-  estMaxLik(true.model,  simulate(true.model))
  summary(est.model)
  est.model
  tfplot(est.model)
  est.model <-  estMaxLik(true.model,  simulate(true.model),
    algorithm.args=list(method="BFGS", upper=Inf, lower=-Inf, hessian=TRUE,
                        control=list(maxit=10000)))



