context("lmvar extractors")

test_that("logLik works correctly", {
  n = nobs(fit)
  mu = fitted( fit, sigma=FALSE)
  sigma = as.numeric(exp(fit$X_sigma %*% coef(fit, mu=FALSE)))
  res = (fit$y - mu) / sigma
  logL = -0.5 * n * log(2 * pi) - sum(log(sigma)) - 0.5 * sum(res * res)

  expect_equal( logLik(fit)[1], logL)
  expect_identical( names(attributes(logLik(fit))), c( "df", "class"))
  expect_equal( attr(logLik(fit), "df"), 7)
})

test_that("coef works correctly", {
  expect_equivalent( coef(fit), c( fit$coefficients_mu, fit$coefficients_sigma))
  expect_identical( coef( fit, mu = FALSE), fit$coefficients_sigma)
  expect_identical( coef( fit, sigma = FALSE), fit$coefficients_mu)
  expect_equivalent( coef( fit, mu = FALSE, sigma = FALSE), numeric())
})

test_that("dfree works correctly", {
  expect_identical( dfree(fit), ncol(fit$X_mu) + ncol(fit$X_sigma))
  expect_identical( dfree( fit, sigma = FALSE), ncol(fit$X_mu))
  expect_identical( dfree( fit, mu = FALSE), ncol(fit$X_sigma))

  no_fit = lmvar_no_fit( fit$y, fit$X_mu[,-1], fit$X_sigma[,-1])
  expect_identical( dfree(fit), dfree(no_fit))
})
