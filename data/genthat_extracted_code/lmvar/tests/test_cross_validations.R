Sys.unsetenv("R_TESTS")

context("cross validations")

test_that("cv.lm works correctly", {

  skip_on_cran()

  # Cross-validation with log = FALSE
  fit_lm = lm( fit$y ~ ., as.data.frame(fit$X_mu), x = TRUE, y = TRUE)
  cv = cv.lm( fit_lm, seed = 1234)

  MAE = list( mean = 0.3515493, sd = 0.02061419)
  MSE = list( mean = 0.3111671, sd = 0.04217903)
  MSE_sqrt = list( mean = 0.5566893, sd = 0.03747786)
  expected = list( MAE = MAE, MSE = MSE, MSE_sqrt = MSE_sqrt)
  class(expected) = "cvlmvar"

  expect_equal( cv, expected, tolerance = 2e-07)

  # Cross-validation with ks_test = TRUE
  cv = cv.lm( fit_lm, ks_test = TRUE, seed = 1234)

  KS_distance = list( mean = 0.1300144, sd = 0.01278697)
  KS_p.value = list( mean = 1.343774e-06, sd = 2.305415e-06)
  expected = list( MAE = MAE, MSE = MSE, MSE_sqrt = MSE_sqrt, KS_distance = KS_distance, KS_p.value = KS_p.value)
  class(expected) = "cvlmvar"

  expect_equal( cv, expected, tolerance = 2e-07)

  # Cross-validation with k = 5
  cv = cv.lm(fit_lm, ks_test = TRUE, seed = 1234, k = 5)

  z = qnorm(0.95) / sqrt(9)

  expect_gt( cv$MAE$mean, MAE$mean - z * MAE$sd)
  expect_lt( cv$MAE$mean, MAE$mean + z * MAE$sd)

  expect_gt( cv$MSE$mean, MSE$mean - z * MSE$sd)
  expect_lt( cv$MSE$mean, MSE$mean + z * MSE$sd)

  expect_gt( cv$MSE_sqrt$mean, MSE_sqrt$mean - z * MSE_sqrt$sd)
  expect_lt( cv$MSE_sqrt$mean, MSE_sqrt$mean + z * MSE_sqrt$sd)

  expect_gt( cv$KS_distance$mean, KS_distance$mean - z * KS_distance$sd)
  expect_lt( cv$KS_distance$mean, KS_distance$mean + z * KS_distance$sd)

  expect_gt( cv$KS_p.value$mean, KS_p.value$mean - 2 * z * KS_p.value$sd)
  expect_lt( cv$KS_p.value$mean, KS_p.value$mean + 2 * z * KS_p.value$sd)

  # Cross-validation with log = TRUE
  fit_lm = lm( fit_log$y ~ ., as.data.frame(fit_log$X_mu), x = TRUE, y = TRUE)
  cv = cv.lm( fit_lm, ks_test = TRUE, seed = 1234, log = TRUE)

  MAE = list( mean = 3.929494, sd = 0.5024568)
  MSE = list( mean = 152.5877, sd = 65.60747)
  MSE_sqrt = list( mean = 12.08463, sd = 2.697598)
  KS_distance = list( mean = 0.04523085, sd = 0.01179434)
  KS_p.value = list( mean = 0.3331347, sd = 0.2685471)
  expected = list( MAE = MAE, MSE = MSE, MSE_sqrt = MSE_sqrt, KS_distance = KS_distance, KS_p.value = KS_p.value)
  class(expected) = "cvlmvar"

  expect_equal( cv, expected, tolerance = 4e-07)
})

test_that("cv.lmvar works correctly", {

  skip_on_cran()

  # Cross-validation with log = FALSE
  cv = cv.lmvar( fit, seed = 1234)

  MAE = list( mean = 0.3510331, sd = 0.02049029)
  MSE = list( mean = 0.3109647, sd = 0.04205719)
  MSE_sqrt = list( mean = 0.5565139, sd = 0.03737182)
  expected = list( MAE = MAE, MSE = MSE, MSE_sqrt = MSE_sqrt)
  class(expected) = "cvlmvar"

  expect_equal( cv, expected, tolerance = 4e-07)

  # Cross-validation with ks_test = TRUE
  cv = cv.lmvar( fit, ks_test = TRUE, seed = 1234)

  KS_distance = list( mean = 0.04161125, sd = 0.01141964)
  KS_p.value = list( mean = 0.4242663, sd = 0.240644)
  expected = list( MAE = MAE, MSE = MSE, MSE_sqrt = MSE_sqrt, KS_distance = KS_distance, KS_p.value = KS_p.value)
  class(expected) = "cvlmvar"

  expect_equal( cv, expected, tolerance = 4e-07)

  # Cross-validation with k = 5
  cv = cv.lmvar(fit, ks_test = TRUE, seed = 1234, k = 5)

  z = qnorm(0.95) / sqrt(9)

  expect_gt( cv$MAE$mean, MAE$mean - z * MAE$sd)
  expect_lt( cv$MAE$mean, MAE$mean + z * MAE$sd)

  expect_gt( cv$MSE$mean, MSE$mean - z * MSE$sd)
  expect_lt( cv$MSE$mean, MSE$mean + z * MSE$sd)

  expect_gt( cv$MSE_sqrt$mean, MSE_sqrt$mean - z * MSE_sqrt$sd)
  expect_lt( cv$MSE_sqrt$mean, MSE_sqrt$mean + z * MSE_sqrt$sd)

  expect_equal( cv$KS_distance$mean, 0.02401601, tolerance = 2e-07)

  expect_gt( cv$KS_p.value$mean, KS_p.value$mean - 2 * z * KS_p.value$sd)
  expect_lt( cv$KS_p.value$mean, KS_p.value$mean + 2 * z * KS_p.value$sd)

  # Cross-validation with log = TRUE
  cv = cv.lmvar(fit_log, ks_test = TRUE, seed = 1234, log = TRUE)

  MAE = list( mean = 3.921774, sd = 0.4851464)
  MSE = list( mean = 151.4644, sd = 63.79524)
  MSE_sqrt = list( mean = 12.05704, sd = 2.60173)
  KS_distance = list( mean = 0.04511014, sd = 0.01125679)
  KS_p.value = list( mean = 0.3301187, sd = 0.2569928)
  expected = list( MAE = MAE, MSE = MSE, MSE_sqrt = MSE_sqrt, KS_distance = KS_distance, KS_p.value = KS_p.value)
  class(expected) = "cvlmvar"

  expect_equal( cv, expected, tolerance = 4e-07)

  # Cross-validation with sigma_min = 0.2
  cv = cv.lmvar( fit, ks_test = TRUE, sigma_min = 0.4, seed = 1234)

  MAE = list( mean = 0.3511199, sd = 0.02060707)
  MSE = list( mean = 0.3110102, sd = 0.04209597)
  MSE_sqrt = list( mean = 0.5565526, sd = 0.0374081)
  KS_distance = list( mean = 0.1322603, sd = 0.01031431)
  KS_p.value = list( mean = 5.709102e-07, sd = 1.2920867e-06)
  expected = list( MAE = MAE, MSE = MSE, MSE_sqrt = MSE_sqrt, KS_distance = KS_distance, KS_p.value = KS_p.value)
  class(expected) = "cvlmvar"

  expect_equal( cv, expected, tolerance = 4e-07)

  # Cross-validation with exclusion
  y = c( fit$y, 100000)
  X_mu = rbind( fit$X_mu, fit$X_mu[1,])
  X_sigma = rbind( fit$X_sigma, fit$X_sigma[1,])
  fit_outl = lmvar( y, X_mu[,-1], X_sigma[,-1])

  cv = cv.lmvar(fit_outl, exclude = 5001, seed = 1234, ks_test = TRUE)

  MAE = list( mean = 0.352181, sd = 0.01780276)
  MSE = list( mean = 0.3121358, sd = 0.05853967)
  MSE_sqrt = list( mean = 0.5566551, sd = 0.05023195)
  KS_distance = list( mean = 0.3209301, sd = 0.0905522)
  KS_p.value = list( mean = 0.003089782, sd = 0.009770748)

  expected = list( MAE = MAE, MSE = MSE, MSE_sqrt = MSE_sqrt, KS_distance = KS_distance, KS_p.value = KS_p.value)
  class(expected) = "cvlmvar"

  expect_equal( cv, expected, tolerance = 4e-07)
})

test_that("print.cvlmvar works correctly", {

  cv = cv.lmvar( fit, max_cores = 2)

  expect_error( capture.output(print.cvlmvar(cv)), NA)
  expect_error( capture.output(print.cvlmvar( cv, digits = 2)), NA)

  cv = cv.lmvar( fit, ks_test = FALSE, max_cores = 2)

  expect_error( capture.output(print.cvlmvar(cv)), NA)
  expect_error( capture.output(print.cvlmvar( cv, digits = 2)), NA)
})

test_that("cv.lmvar works with class Matrix", {

  X_mu = Matrix::Matrix(fit$X_mu)
  X_sigma = Matrix::Matrix(fit$X_sigma)
  fit_Matrix = lmvar( fit$y, X_mu[,-1], X_sigma[,-1])

  expect_error( capture.output(cv.lmvar( fit_Matrix, max_cores = 2)), NA)
})

test_that("cv.lm works with user-supplied function", {

  skip_on_cran()

  # Define user-supplied function
  my_function <- function( object, y, X){

    mu = predict( object, as.data.frame(X))
    sigma = summary(object)$sigma
    residuals_sq = ((y - mu) / sigma)^2
    return(mean(residuals_sq))
  }

  fit_lm = lm( fit$y ~ ., as.data.frame(fit$X_mu), x = TRUE, y = TRUE)
  cv = cv.lm( fit_lm, fun = my_function, seed = 1234)

  MAE = list( mean = 0.3515493, sd = 0.02061419)
  MSE = list( mean = 0.3111671, sd = 0.04217903)
  MSE_sqrt = list( mean = 0.5566893, sd = 0.03747786)
  fun = list( mean = 1.003289, sd = 0.1516515)

  expected = list( MAE = MAE, MSE = MSE, MSE_sqrt = MSE_sqrt, fun = fun)
  class(expected) = "cvlmvar"

  expect_equal( cv, expected, tolerance = 5e-07)
})

test_that("cv.lmvar works with user-supplied function", {

  skip_on_cran()

  # Define user-supplied function
  my_function <- function( object, y, X_mu, X_sigma){

    mu = predict( object, X_mu[,-1], X_sigma[,-1], sigma = FALSE)
    sigma = predict( object, X_mu[,-1], X_sigma[,-1], mu = FALSE)
    residuals_sq = ((y - mu) / sigma)^2
    return(mean(residuals_sq))
  }

  cv = cv.lmvar( fit, fun = my_function, seed = 1234)

  MAE = list( mean = 0.3510331, sd = 0.02049029)
  MSE = list( mean = 0.3109647, sd = 0.04205719)
  MSE_sqrt = list( mean = 0.5565139, sd = 0.03737182)
  fun = list( mean = 1.00334, sd = 0.08011403)

  expected = list( MAE = MAE, MSE = MSE, MSE_sqrt = MSE_sqrt, fun = fun)
  class(expected) = "cvlmvar"

  expect_equal( cv, expected, tolerance = 5e-07)

  # Test with excluded observations
  cv = cv.lmvar( fit, fun = my_function, seed = 1234, exclude = c(1:100, 501:600))

  MAE = list( mean = 0.3500289, sd = 0.01815739)
  MSE = list( mean = 0.310097, sd = 0.03843006)
  MSE_sqrt = list( mean = 0.5559147, sd = 0.03425179)
  fun = list( mean = 0.9963905, sd = 0.07848326)

  expected = list( MAE = MAE, MSE = MSE, MSE_sqrt = MSE_sqrt, fun = fun)
  class(expected) = "cvlmvar"

  expect_equal( cv, expected, tolerance = 5e-07)
})

test_that("cv.lm error handling works", {

  # User specified function gives error
  error_function <- function( object, y, X){
    stop("An error occurred")
  }

  fit_lm = lm( fit$y ~ ., as.data.frame(fit$X_mu), x = TRUE, y = TRUE)
  expect_warning(cv.lm( fit_lm, fun = error_function, max_cores = 2))

  # KS-test gives warning
  X = fit$X_mu
  X = rbind( X, X[1,])
  y = fit$y
  y = c( y, y[1])

  fit_lm = lm( y ~ ., as.data.frame(X), x = TRUE, y = TRUE)
  expect_warning(cv.lm( fit_lm, ks_test = TRUE, max_cores = 2, seed = 2345, k = 2))
})

test_that("cv.lmvar error handling works", {

  # Fits give warnings
  fit_lmvar = suppressWarnings(lmvar( fit$y[1:100], diag(100)[,1:10], diag(100)[,1:10]))
  expect_warning(cv.lmvar( fit_lmvar, max_cores = 2, seed = 2345, k = 2))

  # User specified function gives error
  error_function <- function( object, y, X_mu, X_sigma){
    stop("An error occurred")
  }

  expect_warning(cv.lmvar( fit, fun = error_function, max_cores = 2))

  # KS-test gives warning
  X_mu = fit$X_mu
  X_mu = rbind( X_mu, X_mu[1,])
  X_sigma = fit$X_sigma
  X_sigma = rbind( X_sigma, X_sigma[1,])
  y = fit$y
  y = c( y, y[1])

  fit_lmvar = lmvar( y, X_mu[,-1], X_sigma[,-1])
  expect_warning(cv.lmvar( fit_lmvar, ks_test = TRUE, max_cores = 2, seed = 2345, k = 2))
})

test_that("cv.lm works with model matrix with one column", {

  fit_lm = lm( fit$y ~ 1, x = TRUE, y = TRUE)
  cv = cv.lm( fit_lm, seed = 3456, max_cores = 2)

  MAE = list( mean = 16.06673, sd = 0.40881)
  MSE = list( mean = 370.2567, sd = 17.42943)
  MSE_sqrt = list( mean = 19.23729, sd = 0.4512527)
  expected = list( MAE = MAE, MSE = MSE, MSE_sqrt = MSE_sqrt)
  class(expected) = "cvlmvar"

  expect_equal( cv, expected, tolerance = 4e-07)
})

test_that("cv.lmvar works with model matrix with one column", {

  # model matrices for both mu and sigma contain intercept term only
  fit_test = lmvar(fit$y)
  cv = cv.lmvar( fit_test, seed = 3456, max_cores = 2)

  MAE = list( mean = 16.06673, sd = 0.40881)
  MSE = list( mean = 370.2567, sd = 17.42943)
  MSE_sqrt = list( mean = 19.23729, sd = 0.4512527)
  expected = list( MAE = MAE, MSE = MSE, MSE_sqrt = MSE_sqrt)
  class(expected) = "cvlmvar"

  expect_equal( cv, expected, tolerance = 4e-07)

  # model matrix for sigma contains intercept term only
  fit_test = lmvar( fit$y, fit$X_mu[,-1])
  cv = cv.lmvar( fit_test, seed = 3456, max_cores = 2)

  MAE = list( mean = 0.3515358, sd = 0.0218989)
  MSE = list( mean = 0.3109556, sd = 0.04687408)
  MSE_sqrt = list( mean = 0.5561794, sd = 0.04242742)
  expected = list( MAE = MAE, MSE = MSE, MSE_sqrt = MSE_sqrt)
  class(expected) = "cvlmvar"

  expect_equal( cv, expected, tolerance = 4e-07)

  # model matrix for mu contains intercept term only
  fit_test = lmvar( fit$y, NULL, fit$X_sigma[,-1])
  cv = cv.lmvar( fit_test, seed = 3456, max_cores = 2)

  MAE = list( mean = 16.06676, sd = 0.4087546)
  MSE = list( mean = 370.257, sd = 17.42718)
  MSE_sqrt = list( mean = 19.2373, sd = 0.4511943)
  expected = list( MAE = MAE, MSE = MSE, MSE_sqrt = MSE_sqrt)
  class(expected) = "cvlmvar"

  expect_equal( cv, expected, tolerance = 4e-07)
})
