
context("slice_range")

test_that("slice_range works for lvec objects", {
  x <- as_lvec(1:20)
  
  expect_equal(as_rvec(slice_range(x, c(5,7))), 5:7)
  expect_equal(as_rvec(slice_range(x, begin = 5, end = 7)), 5:7)
  expect_equal(as_rvec(slice_range(x, begin = 5, end = 7, range = c(1,10))), 
    5:7)
  
  expect_equal(slice_range(x, c(5,7), as_r = TRUE), 5:7)
  expect_equal(slice_range(x, begin = 5, end = 7, as_r = TRUE), 5:7)
  expect_equal(slice_range(x, begin = 5, end = 7, range = c(1,10), as_r = TRUE), 
    5:7)
  
  expect_error(slice_range(x, range = c(1, 30)))
  expect_error(slice_range(x, range = c(-11, 7)))
  expect_error(slice_range(x, range = c(NA, 7)))
})


test_that("slice_range works for R vectors", {
  x <- 1:10
  
  expect_equal(slice_range(x, c(5,7)), 5:7)
  expect_equal(slice_range(x, begin = 5, end = 7), 5:7)
  expect_equal(slice_range(x, begin = 5, end = 7, range = c(1,10)), 5:7)
  
  expect_error(slice_range(x, range = c(1, 30)))
  expect_error(slice_range(x, range = c(-11, 7)))
  expect_error(slice_range(x, range = c(NA, 7)))
})


test_that("slice_range works for data.frames", {
  x <- data.frame(x = 1:20, y = letters[1:20])
  
  expect_equal(slice_range(x, c(5,7)), x[5:7, ])
  expect_equal(slice_range(x, begin = 5, end = 7), x[5:7, ])
  expect_equal(slice_range(x, begin = 5, end = 7, range = c(1,10)), x[5:7, ])
  
  expect_error(slice_range(x, range = c(1, 30)))
  expect_error(slice_range(x, range = c(-11, 7)))
  expect_error(slice_range(x, range = c(NA, 7)))
})


test_that("slice_range works for ldat objects", {
  x_r <- data.frame(x = 1:20, y = letters[1:20])
  x <- as_ldat(x_r)
  
  # Use expect_equivalent; otherwise the test trips on differenc row.names
  # which are irrelevant
  expect_equivalent(slice_range(x, c(5,7), as_r = TRUE), x_r[5:7, ])
  expect_equivalent(slice_range(x, begin = 5, end = 7, as_r = TRUE), x_r[5:7, ])
  expect_equivalent(slice_range(x, begin = 5, end = 7, range = c(1,10), as_r = TRUE), 
    x_r[5:7, ])
  
  expect_error(slice_range(x, range = c(1, 30)))
  expect_error(slice_range(x, range = c(-11, 7)))
  expect_error(slice_range(x, range = c(NA, 7)))
})
