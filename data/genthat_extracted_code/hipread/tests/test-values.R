library(hipread)

context("Value conversions")

test_that("whitespace double to NA", {
  actual <- hipread_long(
    hipread_example("test-whitespace.dat"),
    hip_fwf_widths(
      c(1, 1, 1),
      c("rt", "var1", "var2"),
      c("character", "double", "double"),
      imp_dec = c(NA, 0, 1)
    )
  )

  expect_true(all(is.na(actual$var1)), "double no implicit decimal")
  expect_true(all(is.na(actual$var2)), "double one implicit decimal")
})

test_that("whitespace integer to NA", {
  actual <- hipread_long(
    hipread_example("test-whitespace.dat"),
    hip_fwf_widths(c(1, 2), c("rt", "var1"), c("c", "i"))
  )

  expect_true(all(is.na(actual$var1)), "integer")
})
