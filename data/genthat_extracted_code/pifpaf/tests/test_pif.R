context("General Population Impact Fraction point-estimate")

test_that("Checking pif function errors",{
    
  #Check that crashes when kernel and multivariate
  expect_error({
    X <- data.frame(rnorm(100,4,1), rbeta(100, 0.5, 0.5))
    thetahat <- 1.4
    pif(X, thetahat, function(X, theta){X[,1]*X[,2]*theta + 1}, method = "kernel")
  })
  
  #Check that multivariate defaults to empirical
  expect_error({
    X <- data.frame(rbeta(100, 0.5, 0.5))
    thetahat <- 1.4
    pif(X, thetahat, function(X, theta){X*theta + 1}, method = "notamethod")
  })
})