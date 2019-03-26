context("test-eh_test_subtype")

testfit <- eh_test_subtype("subtype", 4, list("x1", "x2", "x3"), subtype_data)

testdat <- dplyr::rename(subtype_data,
  `risk:x1` = x1
)


test_that("eh_test_subtype produces expected eh_pval", {
  expect_equal(
    round(testfit$eh_pval[2, ], 3),
    0.478
  )
})


test_that("eh_test_subtype produces expected dimension of beta", {
  expect_equal(dim(testfit$beta)[1], 3)
  expect_equal(dim(testfit$beta)[2], 4)
})


test_that("eh_test_subtype prints message when label variable is not numeric", {
  expect_error(
    eh_test_subtype(
      "subtype_name",
      4,
      list("x1", "x2", "x3"),
      subtype_data
    ),
    "The argument to label must be numeric or integer. Arguments of type character and factor are not supported, please see the documentation.",
    fixed = TRUE
  )
})


test_that("eh_test_subtype prints message when subtype variable doesn't start with 0", {
  expect_error(
    eh_test_subtype(
      "subtype",
      4,
      list("x1", "x2", "x3"),
      subtype_data[subtype_data$subtype > 0, ]
    ),
    "The argument to label should start with 0. 0 indicates control subjects and cases should be labeled 1 through M, the total number of subtypes.",
    fixed = TRUE
  )
})


test_that("eh_test_subtype prints message when there are fewer than 2 subtype levels", {
  expect_error(
    eh_test_subtype(
      "subtype",
      1,
      list("x1", "x2", "x3"),
      subtype_data
    ),
    "The argument to M, the total number of subtypes, must be a numeric value >=2.",
    fixed = TRUE
  )
})


test_that("eh_test_subtype prints message when M is not equal to the number of subtypes in the data", {
  expect_error(
    eh_test_subtype(
      "subtype",
      2,
      list("x1", "x2", "x3"),
      subtype_data
    ),
    "M is not equal to the number of non-zero levels in the variable supplied to label. Please make sure M reflects the number of subtypes in the data.",
    fixed = TRUE
  )
})


test_that("eh_test_subtype prints message when there is a colon in a variable name", {
  expect_error(
    eh_test_subtype(
      "subtype",
      4,
      list("risk:x1", "x2", "x3"),
      testdat
    ),
    "Risk factor names cannot include colons. Please rename the offending risk factor and try again.",
    fixed = TRUE
  )
})
