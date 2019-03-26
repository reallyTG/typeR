context("test-optimal_kmeans_d")

library(dplyr)

testdat <- subtype_data %>%
  mutate(
    test_case = case_when(
      case == 1 ~ 1,
      case == 0 & x3 == 0 ~ 0,
      case == 0 & x3 == 1 ~ 2
    )
  )

test_that("optimal_kmeans_d prints message when there are fewer than 2 subtype levels", {
  expect_error(
    optimal_kmeans_d(
      markers = c(paste0("y", seq(1:30))),
      M = 1,
      factors = list("x1", "x2", "x3"),
      case = "case",
      data = subtype_data,
      nstart = 100,
      seed = 81110224
    ),
    "The argument to M, the total number of subtypes, must be a numeric value >=2.",
    fixed = TRUE
  )
})


test_that("optimal_kmeans_d prints message if case status not coded 0/1", {
  expect_error(
    optimal_kmeans_d(
      markers = c(paste0("y", seq(1:30))),
      M = 3,
      factors = list("x1", "x2", "x3"),
      case = "test_case",
      data = testdat,
      nstart = 100,
      seed = 81110224
    ),
    "All elements of case must have values 0 or 1",
    fixed = TRUE
  )
})


test_that("optimal_kmeans_d prints message if no seed is set", {
  expect_message(
    optimal_kmeans_d(
      markers = c(paste0("y", seq(1:30))),
      M = 3,
      factors = list("x1", "x2", "x3"),
      case = "case",
      data = subtype_data,
      nstart = 5
    ),
    "When no seed is set the results will not be reproducible.",
    fixed = TRUE
  )
})


test_that("optimal_kmeans_d returns expected optimal_d value", {
  expect_equal(
    round(optimal_kmeans_d(
      markers = c(paste0("y", seq(1:30))),
      M = 3,
      factors = list("x1", "x2", "x3"),
      case = "case",
      data = subtype_data,
      nstart = 5,
      seed = 81110224
    )$optimal_d, 3),
    0.339
  )
})
