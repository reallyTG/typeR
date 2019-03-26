context("lmvar constructor")

test_that("missing arguments are handled correctly", {

  y = fit$y
  fit_test = lmvar(y)
  fitlm = lm( y~1, as.data.frame(fit$X_mu))
  expect_equal( coef(fit_test)[1], coef(fitlm))
  expect_lt( abs(as.numeric(exp(coef(fit_test)[2])) - summary(fitlm)$sigma), 0.002)

})

test_that("no errors occur when working with class Matrix",{

  M_mu = Matrix::Matrix(fit$X_mu)
  M_mu = M_mu[, -1]
  M_sigma = Matrix::Matrix(fit$X_sigma)
  M_sigma = M_sigma[, -1]
  fit_test = lmvar( fit$y, M_mu, M_sigma)
  expect_equal( coef(fit_test), coef(fit))

  expect_error( summary(fit_test), NA)

})

test_that("results compare with standard linear regression",{

  y = fit$y
  M_mu = fit$X_mu
  M_mu = M_mu[,-1]

  fitlm = lm( y~., as.data.frame(as.matrix(M_mu)))
  fitlmvar = lmvar( y, M_mu)

  # compare betas and standard errors
  coeflm = coef(summary(fitlm))
  coeflmvar = as.matrix(coef(summary(fitlmvar)))
  coeflmvar = coeflmvar[ rownames(coeflm),]

  expect_equal( coeflm[,1], coeflmvar[,1])
  expect_equal( signif( coeflm[,2], 2), signif( coeflmvar[,2], 2))

  # Compare sigmas
  sigmalmvar = predict( fitlmvar, mu = FALSE)[1]
  variance = vcov( fitlmvar, mu = FALSE)[1,1]
  sdev = sigmalmvar * sqrt(exp(variance) - 1)
  sigmalm = summary(fitlm)$sigma
  expect_lt( sigmalmvar - sdev, sigmalm)
  expect_gt( sigmalmvar + sdev, sigmalm)
})

test_that("betas are as expected", {

  coeff = coef(summary(fit))

  beta = c( -2, 1, 3, -1.5, -1.1, 0.8, -0.5)

  v = sapply( 1:nrow(coeff), function(i){

    beta_f = coeff[i,1]
    sterr_f = coeff[i,2]
    expect_lt( beta_f - 1.5 * sterr_f, beta[i])
    expect_gt( beta_f + 1.5 * sterr_f, beta[i])
  })
})

test_that("no errors occur when matrix becomes vector", {

  M_mu = fit$X_mu[,2]
  M_sigma = fit$X_sigma[,2]

  expect_error( suppressWarnings(lmvar( fit$y, M_mu, M_sigma)), NA)

})

test_that("coefficient names are as expected", {

  X_mu = fit$X_mu[,-1]
  X_sigma = fit$X_sigma[,-1]

  names_mu = c("A", "B", "C")
  names_sigma = c("D", "E")
  colnames(X_mu) = names_mu
  colnames(X_sigma) = names_sigma

  fit_test = lmvar( fit$y, X_mu, X_sigma)
  expect_equal(names(coef( fit_test, sigma = FALSE)), c( "(Intercept)", names_mu))
  expect_equal(names(coef( fit_test, mu = FALSE)), c( "(Intercept_s)", names_sigma))

  fit_test = lmvar( fit$y, X_mu, X_sigma, intercept_mu = FALSE, intercept_sigma = FALSE)
  expect_equal(names(coef( fit_test, sigma = FALSE)), names_mu)
  expect_equal(names(coef( fit_test, mu = FALSE)), names_sigma)

  fit_test = lmvar(fit$y)
  expect_equal(names(coef( fit_test, sigma = FALSE)), "(Intercept)")
  expect_equal(names(coef( fit_test, mu = FALSE)), "(Intercept_s)")
})

test_that("control options have effect", {

  # Request solver log
  y = fit$y
  fit_test = lmvar(y, control = list(slvr_log = TRUE))
  expect_true("slvr_log" %in% names(fit_test))

  # Fit model without solution
  c1 = rep(1, 7)
  c2 = c( 0, 1, 1, 0, 0, 0, 0)
  c3 = c( 0, 0, 0, 1, 1, 0, 0)
  c4 = c( 0, 0, 0, 0, 0, 1, 1)
  X = matrix( c( c1, c2, c3, c4), nrow = 7)

  suppressWarnings(RNGversion("3.5.0"))
  set.seed(5678)

  y = rnorm( 7, mean = 1)
  beta_start = c(1, -1, -1, -1)

  # Test that warning about Hessian appears
  expect_warning( lmvar( y, X_sigma = X, intercept_sigma = FALSE, slvr_options = list(start = -10 * beta_start)),
                         "Log-likelihood appears not to be at a maximum!")

  # Test that warning about Hessian does not appear
  warnings = capture_warnings(lmvar( y, X_sigma = X, intercept_sigma = FALSE,
                                     slvr_options = list(start = -10 * beta_start),
                                     control = list(check_hessian = FALSE)))
  expect_false(any(grepl( warnings, "Log-likelihood appears not to be at a maximum!")))
})

test_that("solve with constraint on sigma", {

  fit_lmvar = lmvar( fit$y, fit$X_mu[,-1], fit$X_sigma[,-1], sigma_min = 0.2)
  sigma_min = min(fitted( fit_lmvar, mu = FALSE))

  expect_equal( sigma_min, 0.200009, tolerance = 1e-5)
  expect_equal( fit_lmvar$sigma_min, 0.2)
})

test_that("Option to remove degrees of freedom to improve fit", {

  suppressWarnings(RNGversion("3.5.0"))
  set.seed(1349)

  n = 1000
  X_sigma = fit$X_sigma[1:n,]

  col = X_sigma[,1] + X_sigma[,2]

  # Make sure col is not a strict linear combination of the first two columns of X_sigma
  rows = which(col != 0)
  rows = sample( rows, 2)
  col[rows] = -col[rows]

  X_sigma = cbind( X_sigma, col)

  # Kernel of matrix X_sigma[-rows,] is vector (1,1,0,-1)
  start = 10 * c( 1, 1, 0, -1)

  # Check that warning appears
  expect_warning(lmvar( fit$y[1:n], fit$X_mu[1:n,-1], X_sigma[,-1], slvr_options = list(start = start)),
                 "Last step could not find a value above the current.")

  # Check that no warning appears with post removal
  expect_warning(lmvar( fit$y[1:n], fit$X_mu[1:n,-1], X_sigma[,-1], slvr_options = list(start = start),
                    control = list(remove_df_sigma_post = TRUE)), NA)

  X_sigma = fit$X_sigma[1:n,]
  col = X_sigma[,1] + X_sigma[,2]

  # Make sure col is not a strict linear combination of the first two columns of X_sigma
  rows = which(col != 0)
  i = sample( rows, 1)
  col[i] = -col[1]

  X_sigma = cbind( X_sigma, col)

  # Check that no warning appears with pre removal
  expect_warning(lmvar( fit$y[1:n], fit$X_mu[1:n,-1], X_sigma[,-1], slvr_options = list(start = start),
                 control = list(remove_df_sigma_pre = TRUE)), NA)
})

test_that("options 'mu_full_rank' and 'sigma_full_rank' work correctly", {

  X_mu = fit$X_mu
  X_sigma = fit$X_sigma
  col_mu = ncol(X_mu)
  col_sigma = ncol(X_sigma)

  X_mu = cbind( X_mu, X_mu[,1] + X_mu[,2])
  X_sigma = cbind( X_sigma, X_sigma[,1] + X_sigma[,2])

  fit_test = lmvar( fit$y, X_mu[,-1], X_sigma[,-1])
  expect_equal( ncol(fit_test$X_mu), col_mu)
  expect_equal( ncol(fit_test$X_sigma), col_sigma)

  expect_error( suppressWarnings(lmvar( fit$y, X_mu[,-1], X_sigma[,-1], control = list(mu_full_rank = TRUE))),
                regexp = "requires numeric/complex matrix/vector arguments")

  expect_warning( lmvar( fit$y, X_mu[,-1], X_sigma[,-1], control = list(sigma_full_rank = TRUE)),
                  regexp = "Log-likelihood appears not to be at a maximum!")

  expect_error( suppressWarnings(lmvar( fit$y, X_mu[,-1], X_sigma[,-1],
                                        control = list( mu_full_rank = TRUE, sigma_full_rank = TRUE))),
                regexp = "requires numeric/complex matrix/vector arguments")
})

