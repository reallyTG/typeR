context("cumMax()")

test_that("cumMax returns the correct values", {

  expect_true(all(cumMax(1:10) == 1:10))

  expect_true(all(cumMax(c(1,-3.7,5,3,2,5,1,7,8,6)) == c(1,1,5,5,5,5,5,7,8,8)))

  expect_true(all(cumMax(c(3, -2.7, 0.5, 4.1)) == c(3, 3, 3, 4.1)))

  expect_error(cumMax(c("this", "that")), "'x' must be 'numeric' or 'integer'")
  
})
