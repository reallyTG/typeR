context("FindZebra API Client errors")
library("webddx")

test_that("empty query throws error", {
  expect_error(query_fz(character(0)), "Cannot have an empty query",
               fixed = TRUE)
})

test_that("empty fields throws error", {
  expect_error(query_fz("muscle pain", fields = character(0)),
               "Cannot have empty fields",
               fixed = TRUE)
})

test_that("invalid field throws error", {
  expect_error(query_fz("muscle pain", fields = c("invalid field")),
               paste("Invalid field included. See fields parameter under",
                     "?query_fz for more information."),
               fixed = TRUE)
})

test_that("no rows throws error", {
  expect_error(query_fz("muscle pain", num_rows = 0),
               "Cannot ask for less than 1 row of data")
})

