library(ghyp)


### Name: hist-methods
### Title: Histogram for univariate generalized hyperbolic distributions
### Aliases: hist.ghyp hist-methods hist,ghyp-method
### Keywords: hplot methods

### ** Examples

  data(smi.stocks)
  univariate.fit <- fit.ghypuv(data = smi.stocks[,"SMI"],
                               opt.pars = c(mu = FALSE, sigma = FALSE),
                               symmetric = TRUE)
  hist(univariate.fit)



