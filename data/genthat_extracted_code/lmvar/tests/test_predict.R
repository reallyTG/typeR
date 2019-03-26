context("lmvar predict")

test_that("predict works correctly", {

  # Construct prediction matrices
  n = 10
  v1 = rep.int( 1, n)
  v2 = rep.int( -1, n)
  v3 = rep.int( 0, n)
  c1 = c( v1, v1, v3)
  c2 = c( v3, v2, v2)
  c3 = c( v3, v1, v1)
  M  = as.matrix( cbind( c1, c2, c3))
  M_sigma = as.matrix( cbind( c1, c2))
  beta = coef( fit, sigma = FALSE)
  beta_sigma = coef( fit, mu = FALSE)
  colnames(M) = names(beta)[2:4]
  colnames(M_sigma) = names(beta_sigma)[2:3]

  # Calculate predictions
  intercept = rep.int( 1, 3*n)
  predict_mu = as.numeric(cbind( intercept, M) %*% beta)
  predict_sigma = as.numeric(exp( cbind( intercept, M_sigma) %*% beta_sigma))

  # Construct predicted result
  resultM = matrix( c(predict_mu, predict_sigma), ncol = 2)
  colnames(resultM) = c( "mu", "sigma")

  # Basic prediction
  expect_equal( predict( fit, M, M_sigma), resultM)
})

test_that("predict with more/less/re-ordered columns works correctly",{

  M = fit$X_mu
  M_sigma = fit$X_sigma

  beta = coef( fit, sigma = FALSE)
  beta_sigma = coef( fit, mu = FALSE)

  predict_y_from_model = as.numeric(M %*% beta)
  predict_sigma_from_model = as.numeric(exp( M_sigma %*% beta_sigma))

  expected = matrix( c( predict_y_from_model, predict_sigma_from_model), ncol = 2)
  colnames(expected) = c( "mu", "sigma")

  expect_equal( predict(fit), expected)

  # Re-order columns (and leave out intercept term)
  M_m = M[, c(4,3,2)]
  M_sigma_m = M_sigma[,c(3,2)]
  expect_equal( predict( fit, M_m, M_sigma_m), predict(fit))

  # Leave out a column
  M_m = M[,1:3]
  M_sigma_m = as.matrix(M_sigma[,1:2])

  beta_m = beta[colnames(M_m)]
  beta_sigma_m = beta_sigma[colnames(M_sigma_m)]

  predict_y = as.numeric(M_m %*% beta_m)
  predict_sigma = as.numeric(exp( M_sigma_m %*% beta_sigma_m))

  M_m = M_m[,2:3]
  M_sigma_m = as.matrix(M_sigma_m[,2])
  colnames(M_sigma_m) = names(beta_sigma_m)[2]

  expect_warning( predict(fit, M_m, M_sigma[,-1]))
  expect_warning( predict(fit, M[,-1], M_sigma_m))
  expect_warning( predict(fit, M_m, M_sigma_m))

  expected = matrix( c( predict_y, predict_sigma), ncol = 2)
  colnames(expected) = c( "mu", "sigma")

  expect_equal( suppressWarnings(predict( fit, M_m, M_sigma_m)), expected)

  # Add non-existing covariates
  M_m = cbind( M, M[,2])
  M_sigma_m = cbind( M_sigma, M_sigma[,2])
  colnames(M_m)[ncol(M_m)] = "non-existing"
  colnames(M_sigma_m)[ncol(M_sigma_m)] = "non-existing"

  # Remove intercept terms
  M_m = M_m[, -1]
  M_sigma_m = M_sigma_m[, -1]

  expect_equal( predict( fit, M_m, M_sigma_m), predict(fit))

})

test_that("predict with missing matrices works correctly", {

  # Predictions for model in fit
  M = fit$X_mu
  M_sigma = fit$X_sigma

  beta = coef( fit, sigma = FALSE)
  beta_sigma = coef( fit, mu = FALSE)

  predict_y_from_model = as.numeric(M %*% beta)
  predict_sigma_from_model = as.numeric(exp( M_sigma %*% beta_sigma))

  expect_equal( predict( fit, sigma = FALSE), predict_y_from_model)

  expected = matrix( c( predict_y_from_model, predict_sigma_from_model), ncol = 2)
  colnames(expected) = c( "mu", "sigma")

  expect_identical( predict(fit), expected)

  # Model matrices for new model
  nobs = nobs(fit)
  n1 = trunc(nobs / 3)
  n2 = n1
  n3 = nobs - n1 - n2
  v1 = rep.int( 1, n1)
  v2 = rep.int( -1, n2)
  v3 = rep.int( 0, n3)
  c1 = c( v1, v1, v3)
  c2 = c( v3, v2, v2)
  c3 = c( v3, v1, v1)
  M_m  = as.matrix( cbind( c1, c2, c3))
  M_sigma_m = as.matrix( cbind( c1, c2))
  colnames(M_m) = names(beta)[2:4]
  colnames(M_sigma_m) = names(beta_sigma)[2:3]

  # Predictions for new model
  intercept = rep.int( 1, nobs)
  predict_y = as.numeric(cbind( intercept, M_m) %*% beta)
  predict_sigma = as.numeric(exp(cbind( intercept, M_sigma_m) %*% beta_sigma))

  # mu for fit and sigma for new model
  expected = matrix( c( predict_y_from_model, predict_sigma), ncol = 2)
  colnames(expected) = c( "mu", "sigma")

  expect_equal( predict( fit, X_sigma = M_sigma_m), expected)

  # mu for new model and sigma for fit
  expected = matrix( c( predict_y, predict_sigma_from_model), ncol = 2)
  colnames(expected) = c( "mu", "sigma")

  expect_equal( predict( fit, M_m), expected)

  # mu and sigma for new model
  expected = matrix( c( predict_y, predict_sigma), ncol = 2)
  colnames(expected) = c( "mu", "sigma")

  expect_equal( predict( fit, M_m, M_sigma_m), expected)
})

test_that("predict with different output formats works correctly", {

  # Predictions from model
  M = fit$X_mu
  M_sigma = fit$X_sigma

  beta = coef( fit, sigma = FALSE)
  beta_sigma = coef( fit, mu = FALSE)

  # cov_sigma = vcov( fit, mu = FALSE)
  # cov_sigma = M_sigma %*% cov_sigma %*% Matrix::t(M_sigma)
  # variances = diag(cov_sigma)

  predict_y_from_model = as.numeric(M %*% beta)
  predict_sigma_from_model = as.numeric(exp( M_sigma %*% beta_sigma))

  # Different output formats
  expect_identical( predict( fit, sigma=FALSE), predict_y_from_model)
  expect_identical( predict( fit, mu=FALSE), predict_sigma_from_model)

  M_out = matrix( c( predict_y_from_model, predict_sigma_from_model), ncol = 2)
  colnames(M_out) = c( "mu", "sigma")
  expect_identical( predict( fit, matrix=TRUE), M_out)

})

test_that("predict catches difference in number of rows", {

  nobs = nobs(fit)
  M = fit$X_mu
  M_sigma = fit$X_sigma

  M_e = M[ 1:(nobs-1),]
  M_sigma_e = M_sigma[ 1:(nobs-1),]

  expect_error( predict(fit, M_e))
  expect_error( predict(fit, X_sigma = M_sigma_e))
  expect_error( predict(fit, M, M_sigma_e))

})

test_that("predict works with matrices having only intercept", {

  y = fit$y
  M_mu = fit$X_mu
  M_sigma = fit$X_sigma

  # Model matrix for sigma has intercept term only
  fitlmvar = lmvar( y, M_mu[,-1])

  X_sigma = fitlmvar$X_sigma

  predict_y = as.numeric(M_mu %*% coef( fitlmvar, sigma = FALSE))
  predict_sigma = as.numeric(exp( X_sigma %*% coef( fitlmvar, mu = FALSE)))

  expected = matrix( c( predict_y, predict_sigma), ncol = 2)
  colnames(expected) = c( "mu", "sigma")

  expect_equal( predict(fitlmvar), expected)
  expect_equal( predict( fitlmvar, M_mu[,-1]), expected)

  # Model matrix for mu has intercept term only
  fitlmvar = lmvar( y, X_sigma = M_sigma[,-1])

  X_mu = fitlmvar$X_mu

  predict_y = as.numeric(X_mu %*% coef( fitlmvar, sigma = FALSE))
  predict_sigma = as.numeric(exp( M_sigma %*% coef( fitlmvar, mu = FALSE)))

  expected = matrix( c( predict_y, predict_sigma), ncol = 2)
  colnames(expected) = c( "mu", "sigma")

  expect_equal( predict(fitlmvar), expected)
  expect_equal( predict( fitlmvar, X_sigma = M_sigma[,-1]), expected)
})

test_that("predict calculates confidence intervals", {

  X_mu = fit$X_mu
  X_sigma = fit$X_sigma

  mu = fitted( fit, sigma = FALSE)
  sigma = fitted( fit, mu = FALSE)

  # Confidence intervals for mu
  S = vcov( fit, sigma = FALSE)
  S = X_mu %*% S %*% t(X_mu)
  delta_mu = sqrt(diag(S))

  z = stats::qnorm(0.5 + 0.95/2)
  mu_upr = mu + z * delta_mu
  mu_lwr = mu - z * delta_mu

  # Construct expected results
  expected = cbind( mu, mu_lwr, mu_upr)
  colnames(expected) = c( "mu", "mu_lwr", "mu_upr")

  expect_equal( predict(fit, sigma = FALSE, interval = "confidence"), expected)

  # Confidence intervals for sigma
  S = vcov( fit, mu = FALSE)
  S = X_sigma %*% S %*% t(X_sigma)
  delta_sigma = sigma * sqrt(diag(S))

  sigma_upr = sigma + z * delta_sigma
  sigma_lwr = sigma - z * delta_sigma

  # Construct expected results
  expected = cbind( sigma, sigma_lwr, sigma_upr)
  colnames(expected) = c( "sigma", "sigma_lwr", "sigma_upr")

  expect_equal( predict(fit, mu = FALSE, interval = "confidence"), expected)

  # Confidence intervals with different confidence level
  z = stats::qnorm(0.5 + 0.5/2)
  mu_upr = mu + z * delta_mu
  mu_lwr = mu - z * delta_mu
  sigma_upr = sigma + z * delta_sigma
  sigma_lwr = sigma - z * delta_sigma

  # Construct expected results
  expected = cbind( mu, mu_lwr, mu_upr, sigma, sigma_lwr, sigma_upr)
  colnames(expected) = c( "mu", "mu_lwr", "mu_upr", "sigma", "sigma_lwr", "sigma_upr")

  expect_equal( predict(fit, interval = "confidence", level = 0.5), expected)
})

test_that("predict calculates confidence intervals with log=TRUE", {

  X_mu = fit$X_mu
  X_sigma = fit$X_sigma

  mu = fitted( fit, sigma = FALSE, log = TRUE)
  sigma = fitted( fit, mu = FALSE, log = TRUE)
  sigma_not_log = fitted( fit, mu = FALSE)

  # Variance for mu
  S = vcov( fit, sigma = FALSE)
  S = X_mu %*% S %*% t(X_mu)
  variance_mu = diag(S)

  # Variance for log sigma
  S = vcov( fit, mu = FALSE)
  S = X_sigma %*% S %*% t(X_sigma)
  variance_log_sigma = diag(S)

  # Standard deviations for mu
  delta_mu = variance_mu + sigma_not_log^4 * variance_log_sigma
  delta_mu = mu * sqrt(delta_mu)

  # Standard deviations for sigma
  delta_sigma = sigma^2 * variance_mu + sigma_not_log^4 * (2 * sigma + mu^2 / sigma)^2 * variance_log_sigma
  delta_sigma = sqrt(delta_sigma)

  # Confidence intervals
  z = stats::qnorm(0.5 + 0.95/2)
  mu_upr = mu + z * delta_mu
  mu_lwr = mu - z * delta_mu
  sigma_upr = sigma + z * delta_sigma
  sigma_lwr = sigma - z * delta_sigma

  # Construct expected results for mu
  expected = cbind( mu, mu_lwr, mu_upr)
  colnames(expected) = c( "mu", "mu_lwr", "mu_upr")

  expect_equal( predict(fit, sigma = FALSE, interval = "confidence", log = TRUE), expected)

  # Construct expected results for sigma
  expected = cbind( sigma, sigma_lwr, sigma_upr)
  colnames(expected) = c( "sigma", "sigma_lwr", "sigma_upr")

  expect_equal( predict(fit, mu = FALSE, interval = "confidence", log = TRUE), expected)

  # Confidence intervals with different confidence level
  z = stats::qnorm(0.5 + 0.5/2)
  mu_upr = mu + z * delta_mu
  mu_lwr = mu - z * delta_mu
  sigma_upr = sigma + z * delta_sigma
  sigma_lwr = sigma - z * delta_sigma

  # Construct expected results
  expected = cbind( mu, mu_lwr, mu_upr, sigma, sigma_lwr, sigma_upr)
  colnames(expected) = c( "mu", "mu_lwr", "mu_upr", "sigma", "sigma_lwr", "sigma_upr")

  expect_equal( predict(fit, interval = "confidence", level = 0.5, log = TRUE), expected)

})

test_that("predict works correctly for fit without intercept",{

  X_mu = fit$X_mu
  X_sigma = fit$X_sigma

  # No intercept for model matrix for mu
  fit_test = lmvar( fit$y, X_mu[,-1], X_sigma[,-1], intercept_mu = FALSE)

  beta_mu = coef( fit_test, sigma = FALSE)
  beta_sigma = coef( fit_test, mu = FALSE)
  expected_mu = as.numeric(X_mu[,-1] %*% beta_mu)
  expected_sigma = as.numeric(exp(X_sigma %*% beta_sigma))
  expected = cbind( expected_mu, expected_sigma)
  colnames(expected) = c( "mu", "sigma")

  expect_equal( predict( fit_test), expected)
  expect_equal( predict( fit_test, X_mu[,-1], X_sigma[,-1]), expected)

  # No intercept for model matrix for sigma
  fit_test = lmvar( fit$y, X_mu[,-1], X_sigma[,-1], intercept_sigma = FALSE)

  beta_mu = coef( fit_test, sigma = FALSE)
  beta_sigma = coef( fit_test, mu = FALSE)
  expected_mu = as.numeric(X_mu %*% beta_mu)
  expected_sigma = as.numeric(exp(X_sigma[,-1] %*% beta_sigma))
  expected = cbind( expected_mu, expected_sigma)
  colnames(expected) = c( "mu", "sigma")

  expect_equal( predict(fit_test), expected)
  expect_equal( predict( fit_test, X_mu[,-1], X_sigma[,-1]), expected)

  # No intercept for either model matrix
  fit_test = lmvar( fit$y, X_mu[,-1], X_sigma[,-1], intercept_mu = FALSE, intercept_sigma = FALSE)

  beta_mu = coef( fit_test, sigma = FALSE)
  beta_sigma = coef( fit_test, mu = FALSE)
  expected_mu = as.numeric(X_mu[,-1] %*% beta_mu)
  expected_sigma = as.numeric(exp(X_sigma[,-1] %*% beta_sigma))
  expected = cbind( expected_mu, expected_sigma)
  colnames(expected) = c( "mu", "sigma")

  expect_equal( predict( fit_test), expected)
  expect_equal( predict( fit_test, X_mu[,-1], X_sigma[,-1]), expected)
})

test_that("predict calculates prediction intervals", {

  mu = fitted( fit, sigma = FALSE)
  sigma = fitted( fit, mu = FALSE)

  z  = stats::qnorm( 0.5 + 0.95 / 2)
  lwr = mu - z * sigma
  upr = mu + z * sigma

  intervals = predict( fit, interval = "prediction")

  expect_equal( intervals[, "lwr"], lwr)
  expect_equal( intervals[, "upr"], upr)

  z  = stats::qnorm( 0.5 + 0.5 / 2)
  lwr = mu - z * sigma
  upr = mu + z * sigma

  intervals = predict( fit, interval = "prediction", level = 0.5)

  expect_equal( intervals[, "lwr"], lwr)
  expect_equal( intervals[, "upr"], upr)
})

test_that("predict calculates prediction intervals with log = TRUE", {

  mu = fitted( fit, sigma = FALSE)
  sigma = fitted( fit, mu = FALSE)

  z  = stats::qnorm( 0.5 + 0.95 / 2)
  lwr = exp(mu - z * sigma)
  upr = exp(mu + z * sigma)

  intervals = predict( fit, interval = "prediction", log = TRUE)

  expect_equal( intervals[, "lwr"], lwr)
  expect_equal( intervals[, "upr"], upr)

  z  = stats::qnorm( 0.5 + 0.5 / 2)
  lwr = exp(mu - z * sigma)
  upr = exp(mu + z * sigma)

  intervals = predict( fit, interval = "prediction", level = 0.5, log = TRUE)

  expect_equal( intervals[, "lwr"], lwr)
  expect_equal( intervals[, "upr"], upr)
})

