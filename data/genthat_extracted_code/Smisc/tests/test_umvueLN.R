context("umvueLN()")

test_that("umvueLN() matches ProUCL results for Gilbert's data", {

  x <- c(3.161, 4.151, 3.756, 2.202, 1.535, 20.76, 8.42, 7.81, 2.72, 4.43)
  
  y <- round(umvueLN(x), 7)

  proUCL <- c(5.6544289, 1.3944504, 4.4486438)

  expect_true(all(y == proUCL))
  
})

test_that("umvueLN() produces errors as expected", {

  expect_error(umvueLN("7"), "'x' must be numeric")
  expect_error(umvueLN(rnorm(5), tol = -2), "'tol' must be a single")
  expect_error(umvueLN(rnorm(5), tol = c(0.01, 0.011)), "'tol' must be a single")
  expect_error(umvueLN(rnorm(5), tol = "a"), "'tol' must be a single")
  expect_error(umvueLN(rnorm(5), verbose = "a"), "'verbose' must be TRUE")
    
})
