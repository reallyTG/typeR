library(hipread)

context("readr callback compatibility")
test_that("Can use readr callback in a hipread function", {
  skip_on_cran() # Don't prevent readr from updating
  skip_if_not_installed("dplyr") # HipDataFrameCallback requires dplyr

  hipread_callback <- hipread_long_chunked(
    hipread_example("test-basic.dat"),
    HipDataFrameCallback$new(function(x, pos) x),
    4,
    hip_fwf_widths(
      c(1, 2, 1),
      c("var1", "var2", "var3"),
      c("character", "character", "character")
    ),
    hip_rt(1, 0)
  )

  readr_callback <- hipread_long_chunked(
    hipread_example("test-basic.dat"),
    readr::DataFrameCallback$new(function(x, pos) x),
    4,
    hip_fwf_widths(
      c(1, 2, 1),
      c("var1", "var2", "var3"),
      c("character", "character", "character")
    ),
    hip_rt(1, 0)
  )

  expect_equal(hipread_callback, readr_callback)
})

test_that("Can use hipread callback in a readr function", {
  skip_on_cran() # Don't prevent readr from updating
  skip_if_not_installed("dplyr") # HipDataFrameCallback requires dplyr

  readr_callback <- readr::read_csv_chunked(
    readr::readr_example("mtcars.csv"),
    readr::DataFrameCallback$new(function(x, pos) x),
    10,
    col_types = readr::cols()
  )

  hipread_callback <- readr::read_csv_chunked(
    readr::readr_example("mtcars.csv"),
    HipDataFrameCallback$new(function(x, pos) x),
    10,
    col_types = readr::cols()
  )

  expect_equal(hipread_callback, readr_callback)
})
