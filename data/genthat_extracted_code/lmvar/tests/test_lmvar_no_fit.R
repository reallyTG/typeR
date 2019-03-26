context("lmvar_no_fit contructor")

test_that("class lmvar_no_fit is identical to subset of class of lmvar", {

  no_fit = lmvar_no_fit( fit$y, fit$X_mu[,-1], fit$X_sigma[,-1], intercept_mu = fit$intercept_mu,
                         intercept_sigma = fit$intercept_sigma, slvr_options = fit$slvr_options, control = fit$control)

  check_names = names(no_fit)
  i = which(check_names == "call")
  check_names = check_names[-i]

  for (el in check_names){
    expect_identical( no_fit[[el]], fit[[el]])
  }
})

test_that("options 'mu_full_rank' and 'sigma_full_rank' work correctly", {

  X_mu = fit$X_mu
  X_sigma = fit$X_sigma
  col_mu = ncol(X_mu)
  col_sigma = ncol(X_sigma)

  X_mu = cbind( X_mu, X_mu[,1] + X_mu[,2])
  X_sigma = cbind( X_sigma, X_sigma[,1] + X_sigma[,2])

  no_fit = lmvar_no_fit( fit$y, X_mu[,-1], X_sigma[,-1])
  expect_equal( ncol(no_fit$X_mu), col_mu)
  expect_equal( ncol(no_fit$X_sigma), col_sigma)

  no_fit = lmvar_no_fit( fit$y, X_mu[,-1], X_sigma[,-1], control = list(mu_full_rank = TRUE)) # testing only, do not do this
  expect_equal( ncol(no_fit$X_mu), col_mu + 1)
  expect_equal( ncol(no_fit$X_sigma), col_sigma)

  no_fit = lmvar_no_fit( fit$y, X_mu[,-1], X_sigma[,-1], control = list(sigma_full_rank = TRUE)) # testing only, do not do this
  expect_equal( ncol(no_fit$X_mu), col_mu)
  expect_equal( ncol(no_fit$X_sigma), col_sigma + 1)

  no_fit = lmvar_no_fit( fit$y, X_mu[,-1], X_sigma[,-1], control = list( mu_full_rank = TRUE,
                                                                         sigma_full_rank = TRUE)) # testing only, do not do this
  expect_equal( ncol(no_fit$X_mu), col_mu + 1)
  expect_equal( ncol(no_fit$X_sigma), col_sigma + 1)
})
