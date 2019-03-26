library(nprotreg)
context("Conversion Functions: convert_spherical_to_cartesian")

expect_spherical_coords_validation <- function() {

  format_message <- parameter_validators$spherical_coords$base_format_message
  parameter_name <- parameter_validators$spherical_coords$name

  # NULL ---

  spherical_coords <- NULL

  expect_error(
    convert_spherical_to_cartesian(
      spherical_coords = spherical_coords
    ),
    format_message(
      formatting = parameter_validation_messages$cannot_be_null,
      parameter_name
    )
  )

  # non numeric ---

  spherical_coords <- "string"

  expect_error(
    convert_spherical_to_cartesian(
      spherical_coords = spherical_coords
    ),
    format_message(
      formatting = parameter_validation_messages$must_be_numeric,
      parameter_name
    )
  )

  # non matrix ---

  spherical_coords <- vector(mode = "numeric", length = 2)

  expect_error(
    convert_spherical_to_cartesian(
      spherical_coords = spherical_coords
    ),
    format_message(
      formatting = parameter_validation_messages$must_be_matrix,
      parameter_name
    )
  )

  # number of columns other than 2 ---

  spherical_coords <- matrix(1, nrow = 4, ncol = 3)

  expect_error(
    convert_spherical_to_cartesian(
      spherical_coords = spherical_coords
    ),
    format_message(
      formatting = parameter_validation_messages$wrong_number_of_columns,
      parameter_name,
      2
    )
  )
}

test_that("convert_spherical_to_cartesian", {

  # Input validation ---

  expect_spherical_coords_validation()

  # Default use case scenario ---

  # Define the Spherical coordinates of the North and South Poles.

  north_pole <- cbind(0, pi / 2)
  south_pole <- cbind(0, - pi / 2)
  spherical_coords <- rbind(north_pole, south_pole)

  # Get the corresponding Cartesian coordinates.

  actual <- convert_spherical_to_cartesian(spherical_coords)

  # Assert

  expected <- matrix(
                nrow = 2,
                ncol = 3,
                data = c(0, 0, 1, 0, 0, -1),
                byrow = TRUE,
                dimnames = list(NULL, c("x", "y", "z")))

  expect_equal(
        object = actual,
        expected = expected
  )
})