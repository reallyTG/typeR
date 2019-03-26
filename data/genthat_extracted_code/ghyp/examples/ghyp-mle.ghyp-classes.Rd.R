library(ghyp)


### Name: ghyp-mle.ghyp-classes
### Title: Classes ghyp and mle.ghyp
### Aliases: ghyp-class show.ghyp show,ghyp-method mle.ghyp-class
###   show.mle.ghyp show,mle.ghyp-method
### Keywords: classes

### ** Examples

  data(smi.stocks)
  multivariate.fit <- fit.ghypmv(data = smi.stocks,
                                 opt.pars = c(lambda = FALSE, alpha.bar = FALSE),
                                 lambda = 2)
  summary(multivariate.fit)

  vcov(multivariate.fit)
  mean(multivariate.fit)
  logLik(multivariate.fit)
  AIC(multivariate.fit)
  coef(multivariate.fit)

  univariate.fit <- multivariate.fit[1]
  hist(univariate.fit)

  plot(univariate.fit)
  lines(multivariate.fit[2])



