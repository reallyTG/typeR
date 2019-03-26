context("test-d")

test_that("d produces expected value", {
  expect_equal(
    round(d("subtype", 4, list("x1", "x2", "x3"), subtype_data), 3),
    0.410
  )
})


test_that("d prints message when label variable is not numeric", {
  expect_error(
    d("subtype_name", 4, list("x1", "x2", "x3"), subtype_data),
    "The argument to label must be numeric or integer. Arguments of type character and factor are not supported, please see the documentation.",
    fixed = TRUE
  )
})


test_that("d prints message when subtype variable doesn't start with 0", {
  expect_error(
    d("subtype", 4, list("x1", "x2", "x3"), subtype_data[subtype_data$subtype > 0, ]),
    "The argument to label should start with 0. 0 indicates control subjects and cases should be labeled 1 through M, the total number of subtypes.",
    fixed = TRUE
  )
})


test_that("d prints message when there are fewer than 2 subtype levels", {
  expect_error(
    d("subtype", 1, list("x1", "x2", "x3"), subtype_data),
    "The argument to M, the total number of subtypes, must be a numeric value >=2.",
    fixed = TRUE
  )
})


test_that("d prints message when M is not equal to the number of subtypes in the data", {
  expect_error(
    d("subtype", 2, list("x1", "x2", "x3"), subtype_data),
    "M is not equal to the number of non-zero levels in the variable supplied to label. Please make sure M reflects the number of subtypes in the data.",
    fixed = TRUE
  )
})
