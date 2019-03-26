library(ghyp)


### Name: fit.ghypuv
### Title: Fitting generalized hyperbolic distributions to univariate data
### Aliases: fit.ghypuv fit.hypuv fit.NIGuv fit.VGuv fit.tuv fit.gaussuv
### Keywords: iteration optimize distribution models

### ** Examples

  data(smi.stocks)

  nig.fit <- fit.NIGuv(smi.stocks[,"SMI"], opt.pars = c(alpha.bar = FALSE),
                       alpha.bar = 1, control = list(abstol = 1e-8))
  nig.fit

  summary(nig.fit)

  hist(nig.fit)



