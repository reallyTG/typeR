context("test-kernelfunction")

test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})


test_that("kernel.gaussian works", {
  expect_identical(kernel.gaussian(matrix(c(1, 1), nrow = 2))[1,1],  1)
  expect_identical(kernel.gaussian(matrix(c(1, 1), nrow = 2))[1,2],  1)
})


