library(nprotreg)
context("Regression Functions: get_equally_spaced_points")

expect_number_of_points_validation <- function() {

  format_message <- parameter_validators$number_of_points$base_format_message
  parameter_name <- parameter_validators$number_of_points$name

  # NULL ---

  number_of_points <- NULL

  expect_error(
    get_equally_spaced_points(
      number_of_points = number_of_points
    ),
    format_message(
      formatting = parameter_validation_messages$cannot_be_null,
      parameter_name
    )
  )

  # non numeric ---

  number_of_points <- "string"

  expect_error(
    get_equally_spaced_points(
      number_of_points = number_of_points
    ),
    format_message(
      formatting = parameter_validation_messages$must_be_numeric,
      parameter_name
    )
  )

  # non scalar ---

  number_of_points <- matrix(1, nrow = 2, ncol = 3)

  expect_error(
    get_equally_spaced_points(
      number_of_points = number_of_points
    ),
    format_message(
      formatting = parameter_validation_messages$must_be_scalar,
      parameter_name
    )
  )

  # non integer ---

  number_of_points <- 2.1

  expect_error(
    get_equally_spaced_points(
      number_of_points = number_of_points
    ),
    format_message(
      formatting = parameter_validation_messages$must_be_integer,
      parameter_name
    )
  )

  # non positive ---

  number_of_points <- 0

  expect_error(
    get_equally_spaced_points(
      number_of_points = number_of_points
    ),
    format_message(
      formatting = parameter_validation_messages$must_be_positive,
      parameter_name
    )
  )
}

test_that("get_equally_spaced_points", {

  # Input validation ---

  expect_number_of_points_validation()

  # Default use case scenario ---

  # Define the number of points to get.

  number_of_points <- 8

  # Get the Cartesian coordinates of the equally spaced points.

  actual <- get_equally_spaced_points(number_of_points)

  # Assert

  expected <- matrix(
            nrow = 8,
            ncol = 3,
            data = c(0.48412292, -0.875,  0.0000000,
                    -0.57560840, -0.625,  0.5273044,
                     0.08104582, -0.375, -0.9234753,
                     0.60366672, -0.125,  0.7873763,
                    -0.97699012,  0.125, -0.1728158,
                     0.78218209,  0.375, -0.4975602,
                    -0.20265355,  0.625,  0.7538611,
                    -0.22313565,  0.875, -0.4296341),
            byrow = TRUE)

  expect_equal(
        object = actual,
        expected = expected,
        tolerance = 1.0e-7)
})