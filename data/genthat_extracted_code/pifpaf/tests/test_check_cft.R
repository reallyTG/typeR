context("Check Counterfactual")

test_that("Checking check_cft",{
  
  #Check that counterfactual decreases exposure levels
  expect_warning({
    X   <- rnorm(100,4,1)
    cft <- function(X){2*X}
    check.cft(cft, X)
  })
  
  expect_equal({
    X   <- rnorm(100,4,1)
    cft <- function(X){0.5*X}
    check.cft(cft, X)
  }, TRUE)
  
})
