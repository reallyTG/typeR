test_that("Test of utility", {
  u <- util(x = 1, type = "log")
  expect_equal(u, 0)
})
