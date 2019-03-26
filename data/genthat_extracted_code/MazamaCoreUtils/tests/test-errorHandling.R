context("errorHandling")

test_that("stopOnError() is silent when there is no error", {
  # setup
  myFunc <- function(x) {
    a <- log(x)
  }
  result <- try({
    myFunc(10)
  }, silent=TRUE)
  
  expect_silent(stopOnError(result))
  expect_silent(stopOnError(result,"custom error message"))
  
})

test_that("stopOnError() converts error messages", {
  # setup
  myFunc <- function(x) {
    a <- log(x)
  }
  result <- try({
    myFunc("ten")
  }, silent=TRUE)
  
  expect_error(stopOnError(result))
  expect_error(stopOnError(result,"custom error message"),
               "custom error message")

})

