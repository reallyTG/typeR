library(testthat)
library(colorspace)
library(colorpatch)
context("Color Append")

test_that("The appending colors", {
  ColorClass <- getClassDef("color", package = "colorspace")
  
  A <- hex2RGB(colorspace::heat_hcl(5))
  B <- hex2RGB(colorspace::heat_hcl(7))
  C1 <- append(A, B)
  C2 <- append(C1, colorspace::sRGB(0,0,0))
  expect_true(is(A, ColorClass))
  expect_true(is(B, ColorClass))
  expect_true(is(C1, ColorClass))
  expect_true(is(C2, ColorClass))
  expect_equal(length(C1), 12)
  expect_equal(length(C2), 13)
})


