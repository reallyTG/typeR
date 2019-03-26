context("Gradient and Hessian")

test_that("Gradient and Hessian are calculated correctly", {

  skip_on_cran()

  # Define function loglhood exactly as in lmvar
  logLHood <- function(beta_sigma){

    sigma_inv = as.numeric(exp(- X_sigma %*% beta_sigma))
    M = X_mu * sigma_inv
    M = tryCatch( chol2inv(chol(Matrix::t(M) %*% M)),          # Exploit that t(M) %*% M is symmetric and positive-definite

                  error = function(e){
                    i = which.min(beta_sigma)
                    name = colnames(X_sigma)[i]
                    value = beta_sigma[i]
                    message( "Smallest element of beta_sigma is '", name, "' with value ", signif( value, 3))
                    i = which.max(beta_sigma)
                    name = colnames(X_sigma)[i]
                    value = beta_sigma[i]
                    message( "Largest element of beta_sigma is '", name, "' with value ", signif( value, 3))
                    i = which.min(sigma_inv)
                    value = sigma_inv[i]
                    message( "Smallest element of sigma inverse is ", signif( value, 3), " for observation ", i)

                    i = which.max(sigma_inv)
                    value = sigma_inv[i]
                    message( "Largest element of sigma inverse is ", signif( value, 3), " for observation ", i)
                    terms = X_sigma[i,] * beta_sigma
                    i = which.max(terms)
                    message("   largest contribution to predictor is ", signif( terms[i], 3), " for covariate ", colnames(X_sigma)[i],
                            " with beta is ", signif( beta_sigma[i], 3))

                    stop(e)
                  })

    beta_mu = M %*% Matrix::t(X_mu) %*% (y * sigma_inv * sigma_inv)
    mu = as.numeric(X_mu %*% beta_mu)
    res = (y - mu) * sigma_inv

    # Calculate log-likelihood
    logLik= -0.5*n*log(2*pi) + sum(log(sigma_inv)) - 0.5*sum(res*res)

    # Calculate gradient
    dBeta_sigma = as.numeric(Matrix::t(X_sigma) %*% (res*res - 1))  # gradient of log-likelihood w.r.t. beta_sigma

    # Calculate Hessian
    XT = chol(M) %*% Matrix::t(X_mu) %*% (X_sigma * (res * sigma_inv)) # Use Choleski decomposition to have H_ss_1 symmetric
    H_ss_1 = 4 * Matrix::t(XT) %*% XT
    XT = X_sigma * abs(res)
    H_ss_2 = -2 * Matrix::t(XT) %*% XT

    # Set attributes
    attr( logLik, "gradient") = dBeta_sigma
    attr( logLik, "hessian") = H_ss_1 + H_ss_2

    return(logLik)
  }

  # Define function for gradient
  grad <- function(beta_sigma){
    return( attr( logLHood(beta_sigma), "gradient"))
  }

  # Define function for Hessian
  hess <- function(beta_sigma){
    return( attr( logLHood(beta_sigma), "hessian"))
  }

  # Set response vector and matrices
  y = fit$y
  X_mu = fit$X_mu
  X_sigma = fit$X_sigma
  n = nobs(fit)

  # Pick beta_sigma
  beta_sigma = 1.1 * coef( fit, mu = FALSE)

  # Compare analytic with numeric results
  sapply( 1:10, function(i){

    beta_test = beta_sigma / i

    comp = maxLik::compareDerivatives( logLHood, grad, hess = hess, t0 = beta_test, print = FALSE)

    expect_lt( comp$maxRelDiffGrad, 1e-8)
    expect_lt( comp$maxRelDiffHess, 1e-6)
  })
})
