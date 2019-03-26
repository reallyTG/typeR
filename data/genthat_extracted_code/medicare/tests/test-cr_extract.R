context("cr_extract overall tests")

alpha <- hospiceALPHA
nmrc <- hospiceNMRC
rpt <- hospiceRPT

test_that("Using viable parameters works", {
  expect_type(cr_extract(alpha, "S100000", 100, 100, "newname"), "list")
  expect_type(cr_extract(nmrc, "S100000", 700, 100, "newname"), "list")
})

test_that("Trying to subset a file that's not cost report alpha or nmrc gives an error", {
  expect_error(cr_extract(rpt, "S100000", 100, 100, "newname"))
  expect_error(cr_extract(mtcars, "S100000", 100, 100, "newname"))
  expect_error(cr_extract(alpha[, 1:4], "S100000", 100, 100, "newname"))
})

test_that("Subsetting with invalid parameters returns an empty dataset", {
  expect_warning(no_rows <- cr_extract(alpha, "S100000", 700, 100, "newname"))
  expect_equal(nrow(no_rows), 0)
  expect_warning(no_cols <- cr_extract(nmrc, "S100000", 100, 100, "newname"))
  expect_equal(nrow(no_cols), 0)
})