library(ghyp)


### Name: fit.ghypmv
### Title: Fitting generalized hyperbolic distributions to multivariate
###   data
### Aliases: fit.ghypmv fit.hypmv fit.NIGmv fit.VGmv fit.tmv fit.gaussmv
### Keywords: iteration optimize distribution models multivariate

### ** Examples

  data(smi.stocks)

  fit.ghypmv(data = smi.stocks, opt.pars = c(lambda = FALSE), lambda = 2,
             control = list(rel.tol = 1e-5, abs.tol = 1e-5), reltol = 0.01)



