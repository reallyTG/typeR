context("Convergence pre-check")

test_that( "Convergence pre-check", {

  X_sigma = fit$X_sigma
  col = rep( 0, nrow(X_sigma))
  col[1] = 1
  X_sigma = cbind( X_sigma, col)

  pre = lmvar:::convergence_precheck( fit$y, fit$X_mu, X_sigma)
  expect_equal( pre, list(column_numbers = c( 1, 2, 3), column_names = c( "(Intercept_s)", "v1", "v2")))

  pre = lmvar:::convergence_precheck(fit$y, fit$X_mu, fit$X_sigma)
  expect_equal( pre, list(column_numbers = c( 1, 2, 3), column_names = c( "(Intercept_s)", "v1", "v2")))
})
