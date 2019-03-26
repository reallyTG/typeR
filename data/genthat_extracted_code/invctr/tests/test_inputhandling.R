context("Check inputs")
library(invctr)

test_that("Rose tinted glasses", {
  expect_equal(suppressWarnings(sqrt(-1))%00%"error", "error")
  expect_equal(Inf%00%0, 0)
  expect_equal(NULL%00%"It's NULL", "It's NULL")
})
