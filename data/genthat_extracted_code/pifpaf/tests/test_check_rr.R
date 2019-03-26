context("Check relative risk function")

test_that("Checking check.rr function",{
  
  #Check that if rr(0)!=1 then a warning appears
  expect_warning({
    X  <- cbind(rnorm(100,4,1), rbeta(100, 0.5, 0.5))
    rr <- function(X, theta){X[,1]*X[,2]*theta + 3}
    thetahat <- 1.4
    check.rr(X, thetahat, rr)
    
  })
  
  #Check that multivariate defaults to kernel
  expect_true({
    X  <- cbind(rnorm(100,4,1), rbeta(100, 0.5, 0.5))
    rr <- function(X, theta){X[,1]*X[,2]*theta + 1}
    thetahat <- 1.4
    check.rr(X, thetahat, rr)
  })
})