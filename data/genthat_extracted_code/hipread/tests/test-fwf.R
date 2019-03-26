library(hipread)

context("fwf functions")

test_that("fwf_positions and fwf_widths create the same results", {
  expect_equal(
    hip_fwf_positions(c(1, 3, 10), c(2, 9, 12), c("var1", "var2", "var3"), c("c", "c", "c")),
    hip_fwf_widths(c(2, 7, 3), c("var1", "var2", "var3"), c("c", "c", "c"))
  )
})
