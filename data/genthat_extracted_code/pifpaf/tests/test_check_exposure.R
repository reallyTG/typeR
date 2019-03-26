context("Check_exposure")

test_that("Checking check exposure",{
  
  #Check that if X has a negative (exposure) value the function throws an error
  expect_warning({
    X <- as.matrix(runif(100,-.2, 1))
    check.exposure(X)
  })
  
  expect_warning({
    X <- as.matrix(-.1)
    check.exposure(X)
  })
  
  #Check that if all values are positive returns true
  expect_true({
    X <- as.matrix(runif(100))
    check.exposure(X)
  })
  
  expect_true({
    X <- as.matrix(rlnorm(100))
    check.exposure(X)
  })
})