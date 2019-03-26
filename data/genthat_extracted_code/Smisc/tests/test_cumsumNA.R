context("cumsumNA()")

test_that("cumsumNA() is the same as cumsum() when no NAs are present", {

  set.seed(38) 
  x <- rnorm(100)
  expect_true(max(abs(cumsumNA(x) - cumsum(x))) < 1e-12)
    
})

test_that("cumsumNA() handles NA's as promised", {

  x <- c(1, 3, NA, 7, 2, NA, 9)
  res <- c(1, 4, NA, 11, 13, NA, 22)
  expect_true(identical(cumsumNA(x), res))

  expect_true(all(is.na(cumsumNA(as.numeric(rep(NA, 10))))))
  
})

test_that("cumsumNA() produces errors as expected", {

  expect_error(cumsumNA(c("this", NA)), "'x' must be numeric")
    
})
