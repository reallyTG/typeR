library(nprotreg)
context("Regression Functions: weight_explanatory_points")

expect_concentration_validation <- function() {

  format_message <- parameter_validators$concentration$base_format_message
  parameter_name <- parameter_validators$concentration$name

  get_valid_points <- function() {
    matrix(0, nrow = 4, ncol = 3)
  }

  # NULL ---

  concentration <- NULL

  expect_error(
    weight_explanatory_points(
      evaluation_points = get_valid_points(),
      explanatory_points = get_valid_points(),
      concentration = concentration
    ),
    format_message(
      formatting = parameter_validation_messages$cannot_be_null,
      parameter_name
    )
  )

  # non numeric ---

  concentration <- "string"

  expect_error(
    weight_explanatory_points(
      evaluation_points = get_valid_points(),
      explanatory_points = get_valid_points(),
      concentration = concentration
    ),
    format_message(
      formatting = parameter_validation_messages$must_be_numeric,
      parameter_name
    )
  )

  # non scalar ---

  concentration <- matrix(1, nrow = 2, ncol = 3)

  expect_error(
    weight_explanatory_points(
      evaluation_points = get_valid_points(),
      explanatory_points = get_valid_points(),
      concentration = concentration
    ),
    format_message(
      formatting = parameter_validation_messages$must_be_scalar,
      parameter_name
    )
  )

  # negative ---

  concentration <- -1.0

  expect_error(
    weight_explanatory_points(
      evaluation_points = get_valid_points(),
      explanatory_points = get_valid_points(),
      concentration = concentration
    ),
    format_message(
      formatting = parameter_validation_messages$must_be_non_negative,
      parameter_name
    )
  )
}

expect_evaluation_points_validation <- function() {

  format_message <- parameter_validators$evaluation_points$base_format_message
  parameter_name <- parameter_validators$evaluation_points$name

  get_valid_points <- function() {
    matrix(0, nrow = 4, ncol = 3)
  }
  concentration <- 1.0

  # NULL ---

  evaluation_points <- NULL

  expect_error(
    weight_explanatory_points(
      evaluation_points = evaluation_points,
      explanatory_points = get_valid_points(),
      concentration = concentration
    ),
    format_message(
      formatting = parameter_validation_messages$cannot_be_null,
      parameter_name
    )
  )

  # non numeric ---

  evaluation_points <- "string"

  expect_error(
    weight_explanatory_points(
      evaluation_points = evaluation_points,
      explanatory_points = get_valid_points(),
      concentration = concentration
    ),
    format_message(
      formatting = parameter_validation_messages$must_be_numeric,
      parameter_name
    )
  )

  # non matrix ---

  evaluation_points <- vector(mode = "numeric", length = 2)

  expect_error(
    weight_explanatory_points(
      evaluation_points = evaluation_points,
      explanatory_points = get_valid_points(),
      concentration = concentration
    ),
    format_message(
      formatting = parameter_validation_messages$must_be_matrix,
      parameter_name
    )
  )

  # number of columns other than 3 ---

  evaluation_points <- matrix(1, nrow = 4, ncol = 2)

  expect_error(
    weight_explanatory_points(
      evaluation_points = evaluation_points,
      explanatory_points = get_valid_points(),
      concentration = concentration
    ),
    format_message(
      formatting = parameter_validation_messages$wrong_number_of_columns,
      parameter_name,
      3
    )
  )
}

expect_explanatory_points_validation <- function() {

  format_message <- parameter_validators$explanatory_points$base_format_message
  parameter_name <- parameter_validators$explanatory_points$name

  get_valid_points <- function() {
    matrix(0, nrow = 4, ncol = 3)
  }
  concentration <- 1.0

  # NULL ---

  explanatory_points <- NULL

  expect_error(
    weight_explanatory_points(
      evaluation_points = get_valid_points(),
      explanatory_points = explanatory_points,
      concentration = concentration
    ),
    format_message(
      formatting = parameter_validation_messages$cannot_be_null,
      parameter_name
    )
  )

  # non numeric ---

  explanatory_points <- "string"

  expect_error(
    weight_explanatory_points(
      evaluation_points = get_valid_points(),
      explanatory_points = explanatory_points,
      concentration = concentration
    ),
    format_message(
      formatting = parameter_validation_messages$must_be_numeric,
      parameter_name
    )
  )

  # non matrix ---

  explanatory_points <- vector(mode = "numeric", length = 2)

  expect_error(
    weight_explanatory_points(
      evaluation_points = get_valid_points(),
      explanatory_points = explanatory_points,
      concentration = concentration
    ),
    format_message(
      formatting = parameter_validation_messages$must_be_matrix,
      parameter_name
    )
  )

  # number of columns other than 3 ---

  explanatory_points <- matrix(1, nrow = 4, ncol = 2)

  expect_error(
    weight_explanatory_points(
      evaluation_points = get_valid_points(),
      explanatory_points = explanatory_points,
      concentration = concentration
    ),
    format_message(
      formatting = parameter_validation_messages$wrong_number_of_columns,
      parameter_name,
      3
    )
  )
}

test_that("weight_explanatory_points", {

  # Input validation ---

  expect_concentration_validation()
  expect_evaluation_points_validation()
  expect_explanatory_points_validation()

  # Default use case scenario ---

  # Define a matrix of evaluation points.

  north_pole <- cbind(0, 0, 1)
  south_pole <- cbind(0, 0, -1)
  evaluation_points <- rbind(north_pole, south_pole)

  # Define a matrix of explanatory points

  explanatory_points <- rbind(
    cbind(.5, 0, .8660254),
    cbind(-.5, 0, .8660254),
    cbind(1, 0, 0),
    cbind(0, 1, 0),
    cbind(-1, 0, 0),
    cbind(0, -1, 0),
    cbind(.5, 0, -.8660254),
    cbind(-.5, 0, -.8660254)
  )

  # Define a value for the concentration parameter.

  concentration <- 1.0

  # Weight the explanatory points.

  actual <- weight_explanatory_points(evaluation_points,
                                      explanatory_points,
                                      concentration)

  # Assert

  expected <- matrix(
            nrow = 8,
            ncol = 2,
            data = c(0.8746123, 0.1547375,
                     0.8746123, 0.1547375,
                     0.3678794, 0.3678794,
                     0.3678794, 0.3678794,
                     0.3678794, 0.3678794,
                     0.3678794, 0.3678794,
                     0.1547375, 0.8746123,
                     0.1547375, 0.8746123),
            byrow = TRUE)

  expect_equal(
        object = actual,
        expected = expected,
        tolerance = 1.0e-7)
})