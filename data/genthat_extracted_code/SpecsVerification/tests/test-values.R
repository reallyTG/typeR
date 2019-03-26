context('Scores of some specific forecasts')

test_that('EnsCrps returns correct values', {
  expect_equal(EnsCrps(matrix(1:3, 1, 3), 1.5), 5/6 - 4/9)
  expect_equal(EnsCrps(matrix(1:3, 1, 3), 1.5, R.new=Inf), 5/6 - 4/6)
  expect_equal(EnsCrps(matrix(1:3, 1, 3), 1.5, R.new=7), 5/6 - 4/6 * (1 - 1/7))
  expect_equal(EnsCrps(matrix(1:3, 1, 3), 1.5, R.new=1), 5/6)
  expect_equal(EnsCrps(matrix(1), 2), 1)
  expect_equal(EnsCrps(matrix(1), 2, R.new=1), 1)
  expect_equal(EnsCrps(matrix(1), 2, R.new=Inf), NA_real_)
  expect_equal(EnsCrps(matrix(1:3, 1, 3), 2, R.new=0), NA_real_)
  expect_equal(EnsCrps(matrix(c(1:5, NA), 2, 3, TRUE), c(1.5, 4.5)), c(5/6-4/9, 1/2-1/4))
  expect_equal(EnsCrps(matrix(c(NA,NA), 1, 2), 1), NA_real_)
  expect_equal(EnsCrps(matrix(1:2, 1, 2), NA), NA_real_)
})


