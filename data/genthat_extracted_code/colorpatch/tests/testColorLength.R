library(testthat)
library(colorspace)
library(colorpatch)

context("Color Length")

test_that("The length of a color palette", {
  expect_equal(length(RGB()), 0)
  expect_equal(length(hex2RGB(heat_hcl(10))), 10)
})

