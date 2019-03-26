library(nprotreg)
context("Regression Functions: get_skew_symmetric_matrix")

expect_independent_components_validation <- function() {

  format_message <- parameter_validators$independent_components$
    base_format_message
  parameter_name <- parameter_validators$independent_components$name

  # NULL ---

  independent_components <- NULL

  expect_error(
    get_skew_symmetric_matrix(
      independent_components
    ),
    format_message(
      formatting = parameter_validation_messages$cannot_be_null,
      parameter_name
    )
  )

  # non numeric ---

  independent_components <- "string"

  expect_error(
    get_skew_symmetric_matrix(
      independent_components
    ),
    format_message(
      formatting = parameter_validation_messages$must_be_numeric,
      parameter_name
    )
  )

  # length other than 3 ---

  independent_components <- vector(mode = "numeric", length = 2)

  expect_error(
    get_skew_symmetric_matrix(
      independent_components
    ),
    format_message(
      formatting = parameter_validation_messages$wrong_length,
      parameter_name,
      3
    )
  )
}

test_that("get_skew_symmetric_matrix", {

  # Input validation ---

  expect_independent_components_validation()

  # Default use case scenario ---

  # Define a vector of independent components.

  independent_components <- cbind(1, 2, 3)

  # Get the corresponding 3-by-3 skew symmetric matrix.

  actual <- get_skew_symmetric_matrix(independent_components)

  # Assert

  expected <- matrix(
            nrow = 3,
            ncol = 3,
            data = c(0, -3, 2, 3, 0, -1, -2, 1, 0),
            byrow = TRUE)

  expect_equal(
          object = actual,
          expected = expected,
          tolerance = 1.0e-7)
})