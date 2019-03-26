context("unit conversions")

test_that("French catheter size to mm bad input", {
  expect_error(french_to_diameter_mm(-12))
  expect_error(french_to_diameter_mm("1"))
})

test_that("French catheter size to mm single input", {
  expect_equal(french_to_diameter_mm(1), 3)
  expect_equal(diameter_mm_to_french(3), 1)
})

test_that("French catheter size to mm multiple input", {
  expect_equal(french_to_diameter_mm(c(1, 2, 3)), c(3, 6, 9))
  expect_equal(diameter_mm_to_french(c(3, 6, 9)), c(1, 2, 3))
})
