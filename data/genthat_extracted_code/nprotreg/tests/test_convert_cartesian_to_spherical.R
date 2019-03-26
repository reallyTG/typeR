library(nprotreg)
context("Conversion Functions: convert_cartesian_to_spherical")

expect_cartesian_coords_validation <- function() {

  format_message <- parameter_validators$cartesian_coords$base_format_message
  parameter_name <- parameter_validators$cartesian_coords$name

  # NULL ---

  cartesian_coords <- NULL

  expect_error(
    convert_cartesian_to_spherical(
      cartesian_coords = cartesian_coords
    ),
    format_message(
      formatting = parameter_validation_messages$cannot_be_null,
      parameter_name
    )
  )

  # non numeric ---

  cartesian_coords <- "string"

  expect_error(
    convert_cartesian_to_spherical(
      cartesian_coords = cartesian_coords
    ),
    format_message(
      formatting = parameter_validation_messages$must_be_numeric,
      parameter_name
    )
  )

  # non matrix ---

  cartesian_coords <- vector(mode="numeric", length = 2)

  expect_error(
    convert_cartesian_to_spherical(
      cartesian_coords = cartesian_coords
    ),
    format_message(
      formatting = parameter_validation_messages$must_be_matrix,
      parameter_name
    )
  )

  # number of columns other than 3 ---

  cartesian_coords <- matrix(1, nrow = 4, ncol = 2)

  expect_error(
    convert_cartesian_to_spherical(
      cartesian_coords = cartesian_coords
    ),
    format_message(
      formatting = parameter_validation_messages$wrong_number_of_columns,
      parameter_name,
      3
    )
  )
}

test_that("convert_cartesian_to_spherical", {

  # Input validation ---

  expect_cartesian_coords_validation()

  # Default use case scenario ---

  # Define the Cartesian coordinates of the North and South Poles.

  north_pole <- cbind(0, 0, 1)
  south_pole <- cbind(0, 0, -1)
  cartesian_coords <- rbind(north_pole, south_pole)

  # Get the corresponding Spherical coordinates.

  actual <- convert_cartesian_to_spherical(cartesian_coords)

  # Assert

  expected <- matrix(
                nrow = 2,
                ncol = 2,
                data = c(0, pi / 2, 0, - pi / 2),
                byrow = TRUE,
                dimnames = list(NULL, c("lon", "lat")))

  expect_equal(
        object = actual,
        expected = expected)
})
