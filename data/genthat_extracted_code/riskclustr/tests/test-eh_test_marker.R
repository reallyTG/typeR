context("test-eh_test_marker")

library(dplyr)

testfit <- eh_test_marker(list("marker1", "marker2"),
  list("x1", "x2", "x3"),
  "case",
  subtype_data,
  digits = 2
)

testdat <- subtype_data %>%
  mutate(
    `risk:x1` = x1,
    test_marker = case_when(
      marker1 == 0 ~ 0,
      marker1 == 1 & marker2 == 0 ~ 1,
      marker1 == 1 & marker2 == 1 ~ 2
    ),
    test_case = case_when(
      case == 1 ~ 1,
      case == 0 & x3 == 0 ~ 0,
      case == 0 & x3 == 1 ~ 2
    )
  )



test_that("eh_test_marker produces expected eh_pval", {
  expect_equal(
    unname(round(testfit$eh_pval[2], 3)),
    0.478
  )
})


test_that("eh_test_marker produces expected dimension of gamma", {
  expect_equal(dim(testfit$gamma)[1], 3)
  expect_equal(dim(testfit$gamma)[2], 2)
})


test_that("eh_test_marker prints message if disease marker is not coded 0/1", {
  expect_error(
    eh_test_marker(list("test_marker", "marker2"),
      list("x1", "x2", "x3"),
      "case",
      testdat,
      digits = 2
    ),
    "All non-missing elements of tm must have values 0 or 1",
    fixed = TRUE
  )
})


test_that("eh_test_marker prints message if case status not coded 0/1", {
  expect_error(
    eh_test_marker(list("marker1", "marker2"),
      list("x1", "x2", "x3"),
      "test_case",
      testdat,
      digits = 2
    ),
    "All elements of case must have values 0 or 1",
    fixed = TRUE
  )
})


test_that("eh_test_marker prints message when there is a colon in a variable name", {
  expect_error(
    eh_test_marker(list("marker1", "marker2"),
      list("risk:x1", "x2", "x3"),
      "case",
      testdat,
      digits = 2
    ),
    "Risk factor names cannot include colons. Please rename the offending risk factor and try again.",
    fixed = TRUE
  )
})
