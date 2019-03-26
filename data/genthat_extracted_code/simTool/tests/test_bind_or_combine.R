testthat::context("test_bind_or_combine.R")

test_that("Unnamed vector combined to one column", {
  expect_identical(bind_or_combine(1:2, 3:5), tibble::tibble(value = 1:5))
})

test_that("Named vectors combined to multiple columns", {
  expect_identical(
    bind_or_combine(c(min = 1, max = 1), c(min = 2, max = 3), c(a = 1)),
    tibble::tibble(min = c(1, 2, NA), max = c(1, 3, NA), a = c(NA, NA, 1))
  )
})

test_that("Repair colnames", {
  expect_identical(
    repair_col_names(c("", "", "")),
    paste0("V", 1:3)
  )
  expect_identical(
    repair_col_names(c("V1", "d", "")),
    c("V1", "d", "V2")
  )
})

test_that("Matrix is converted to tibble", {
  expect_identical(
    bind_or_combine(matrix(1:6, 2, 3)),
    tibble::tibble(V1 = 1:2, V2 = 3:4, V3 = 5:6)
  )
})

test_that("Matrix is converted to tibble. Colnames preserved", {
  expect_identical(
    bind_or_combine(structure(1:6, .Dim = 3:2, .Dimnames = list(NULL, letters[1:2]))),
    tibble::tibble(a = 1:3, b = 4:6)
  )
})
