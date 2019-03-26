context("Test 'mfv()' function")

test_that("'mfv()' returns the most frequent value(s)", {
  expect_identical(mfv(c(3, 3, 3, 2, 4)), 3)
  expect_identical(mfv(c(TRUE, FALSE, TRUE)), TRUE)
  expect_identical(mfv(c("a", "a", "b", "a", "d")), "a")
  expect_identical(mfv(c("a", "a", "b", "b", "d")), c("a", "b"))
  expect_identical(mfv1(c("a", "a", "b", "b", "d")), "a")
})

test_that("'mfv()' works with missing values", {
  expect_identical(mfv(c(3, 3, 3, 2, NA)), 3)
  expect_identical(mfv(c(3, 3, 2, NA)), NA_real_)
  expect_identical(mfv(c(3, 3, 2, NA), na.rm = TRUE), 3)
  expect_identical(mfv(c("a", "a", "b", "b", "d")), c("a", "b"))
  expect_identical(mfv(c(NA, NA), na.rm = TRUE), NaN)
})
