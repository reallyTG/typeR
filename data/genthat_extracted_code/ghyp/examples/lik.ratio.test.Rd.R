library(ghyp)


### Name: lik.ratio.test
### Title: Likelihood-ratio test
### Aliases: lik.ratio.test
### Keywords: utilities

### ** Examples

  data(smi.stocks)

  sample <- smi.stocks[, "SMI"]

  t.symmetric <- fit.tuv(sample, silent = TRUE, symmetric = TRUE)
  t.asymmetric <- fit.tuv(sample, silent = TRUE)

  # Test symmetric Student-t against asymmetric Student-t in case
  # of SMI log-returns
  lik.ratio.test(t.asymmetric, t.symmetric, conf.level = 0.95)
  # -> keep the null hypothesis

  set.seed(1000)
  sample <- rghyp(1000, student.t(gamma = 0.1))

  t.symmetric <- fit.tuv(sample, silent = TRUE, symmetric = TRUE)
  t.asymmetric <- fit.tuv(sample, silent = TRUE)

  # Test symmetric Student-t against asymmetric Student-t in case of
  # data simulated according to a slightly skewed Student-t distribution
  lik.ratio.test(t.asymmetric, t.symmetric, conf.level = 0.95)
  # -> reject the null hypothesis

  t.symmetric <- fit.tuv(sample, silent = TRUE, symmetric = TRUE)
  ghyp.asymmetric <- fit.ghypuv(sample, silent = TRUE)

  # Test symmetric Student-t against asymmetric generalized
  # hyperbolic using the same data as in the example above
  lik.ratio.test(ghyp.asymmetric, t.symmetric, conf.level = 0.95)
  # -> keep the null hypothesis



