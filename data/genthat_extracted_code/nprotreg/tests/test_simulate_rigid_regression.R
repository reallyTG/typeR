library(nprotreg)
context("Regression Functions: simulate_rigid_regression")

expect_explanatory_points_validation <- function() {

  format_message <- parameter_validators$explanatory_points$base_format_message
  parameter_name <- parameter_validators$explanatory_points$name

  get_valid_rotation_matrix <- function() {
    expm(
      get_skew_symmetric_matrix(
        cbind(-0.36, 0.48, -0.8)
      )
    )
  }
  get_valid_local_operator <- function(point) {
    point
  }

  # NULL ---

  explanatory_points <- NULL

  expect_error(
    simulate_rigid_regression(
      explanatory_points = explanatory_points,
      rotation_matrix = get_valid_rotation_matrix(),
      local_error_sampler = get_valid_local_operator
    ),
    format_message(
      formatting = parameter_validation_messages$cannot_be_null,
      parameter_name
    )
  )

  # non numeric ---

  explanatory_points <- "string"

  expect_error(
    simulate_rigid_regression(
      explanatory_points = explanatory_points,
      rotation_matrix = get_valid_rotation_matrix(),
      local_error_sampler = get_valid_local_operator
    ),
    format_message(
      formatting = parameter_validation_messages$must_be_numeric,
      parameter_name
    )
  )

  # non matrix ---

  explanatory_points <- vector(mode = "numeric", length = 2)

  expect_error(
    simulate_rigid_regression(
      explanatory_points = explanatory_points,
      rotation_matrix = get_valid_rotation_matrix(),
      local_error_sampler = get_valid_local_operator
    ),
    format_message(
      formatting = parameter_validation_messages$must_be_matrix,
      parameter_name
    )
  )

  # number of columns other than 3 ---

  explanatory_points <- matrix(1, nrow = 4, ncol = 2)

  expect_error(
    simulate_rigid_regression(
      explanatory_points = explanatory_points,
      rotation_matrix = get_valid_rotation_matrix(),
      local_error_sampler = get_valid_local_operator
    ),
    format_message(
      formatting = parameter_validation_messages$wrong_number_of_columns,
      parameter_name,
      3
    )
  )
}

expect_rotation_matrix_validation <- function() {

  format_message <- parameter_validators$rotation_matrix$base_format_message
  parameter_name <- parameter_validators$rotation_matrix$name

  get_valid_points <- function() {
    matrix(0, nrow = 4, ncol = 3)
  }
  get_valid_local_operator <- function(point) {
    point
  }

  # NULL ---

  rotation_matrix <- NULL

  expect_error(
    simulate_rigid_regression(
      explanatory_points = get_valid_points(),
      rotation_matrix = rotation_matrix,
      local_error_sampler = get_valid_local_operator
    ),
    format_message(
      formatting = parameter_validation_messages$cannot_be_null,
      parameter_name
    )
  )

  # non numeric ---

  rotation_matrix <- "string"

  expect_error(
    simulate_rigid_regression(
      explanatory_points = get_valid_points(),
      rotation_matrix = rotation_matrix,
      local_error_sampler = get_valid_local_operator
    ),
    format_message(
      formatting = parameter_validation_messages$must_be_numeric,
      parameter_name
    )
  )

  # non matrix ---

  rotation_matrix <- vector(mode = "numeric", length = 2)

  expect_error(
    simulate_rigid_regression(
      explanatory_points = get_valid_points(),
      rotation_matrix = rotation_matrix,
      local_error_sampler = get_valid_local_operator
    ),
    format_message(
      formatting = parameter_validation_messages$must_be_matrix,
      parameter_name
    )
  )

  # not square ---

  rotation_matrix <- matrix(1, nrow = 4, ncol = 2)

  expect_error(
    simulate_rigid_regression(
      explanatory_points = get_valid_points(),
      rotation_matrix = rotation_matrix,
      local_error_sampler = get_valid_local_operator
    ),
    format_message(
      formatting = parameter_validation_messages$must_be_square,
      parameter_name,
      3
    )
  )

  # number of columns other than 3 ---

  rotation_matrix <- matrix(1, nrow = 2, ncol = 2)

  expect_error(
    simulate_rigid_regression(
      explanatory_points = get_valid_points(),
      rotation_matrix = rotation_matrix,
      local_error_sampler = get_valid_local_operator
    ),
    format_message(
      formatting = parameter_validation_messages$wrong_number_of_columns,
      parameter_name,
      3
    )
  )

  # not orthogonal ---

  rotation_matrix <- matrix(1, nrow = 3, ncol = 3)

  expect_error(
    simulate_rigid_regression(
      explanatory_points = get_valid_points(),
      rotation_matrix = rotation_matrix,
      local_error_sampler = get_valid_local_operator
    ),
    format_message(
      formatting = parameter_validation_messages$must_be_orthogonal,
      parameter_name
    )
  )
}

expect_local_error_sampler_validation <- function() {

  format_message <- fnc_typed_parameter_validators$local_error_sampler$base_format_message
  parameter_name <- fnc_typed_parameter_validators$local_error_sampler$name

  get_valid_points <- function() {
    matrix(0, nrow = 4, ncol = 3)
  }
  get_valid_rotation_matrix <- function() {
    expm(
      get_skew_symmetric_matrix(
        cbind(-0.36, 0.48, -0.8)
      )
    )
  }

  # NULL ---

  local_error_sampler <- NULL

  expect_error(
    simulate_rigid_regression(
      explanatory_points = get_valid_points(),
      rotation_matrix = get_valid_rotation_matrix(),
      local_error_sampler = local_error_sampler
    ),
    format_message(
      formatting = parameter_validation_messages$cannot_be_null,
      parameter_name
    )
  )

  # non function ---

  local_error_sampler <- "string"

  expect_error(
    simulate_rigid_regression(
      explanatory_points = get_valid_points(),
      rotation_matrix = get_valid_rotation_matrix(),
      local_error_sampler = local_error_sampler
    ),
    format_message(
      formatting = parameter_validation_messages$must_be_function,
      parameter_name
    )
  )

  # wrong number of parameters ---

  local_error_sampler <- function(first, second) {
    vector(mode = "numeric", length = 2)
  }

  expect_error(
    simulate_rigid_regression(
      explanatory_points = get_valid_points(),
      rotation_matrix = get_valid_rotation_matrix(),
      local_error_sampler = local_error_sampler
    ),
    format_message(
      formatting = fnc_typed_parameter_validation_messages$wrong_number_of_function_params,
      parameter_name,
      1
    )
  )

  # missing expected parameter ---

  local_error_sampler <- function(first) {
    vector(mode = "numeric", length = 2)
  }

  expect_error(
    simulate_rigid_regression(
      explanatory_points = get_valid_points(),
      rotation_matrix = get_valid_rotation_matrix(),
      local_error_sampler = local_error_sampler
    ),
    format_message(
      formatting = fnc_typed_parameter_validation_messages$missing_function_param,
      parameter_name,
      "point"
    )
  )

  # return value is NULL ---

  local_error_sampler <- function(point) {
    NULL
  }

  expect_error(
    simulate_rigid_regression(
      explanatory_points = get_valid_points(),
      rotation_matrix = get_valid_rotation_matrix(),
      local_error_sampler = local_error_sampler
    ),
    format_message(
      formatting = fnc_typed_parameter_validation_messages$cannot_return_null,
      parameter_name
    )
  )

  # return value is non numeric ---

  local_error_sampler <- function(point) {
    "string"
  }

  expect_error(
    simulate_rigid_regression(
      explanatory_points = get_valid_points(),
      rotation_matrix = get_valid_rotation_matrix(),
      local_error_sampler = local_error_sampler
    ),
    format_message(
      formatting = fnc_typed_parameter_validation_messages$cannot_return_non_numeric,
      parameter_name
    )
  )

  # return value has wrong length ---

  local_error_sampler <- function(point) {
    vector(mode = "numeric", length = 2)
  }

  expect_error(
    simulate_rigid_regression(
      explanatory_points = get_valid_points(),
      rotation_matrix = get_valid_rotation_matrix(),
      local_error_sampler = local_error_sampler
    ),
    format_message(
      formatting = fnc_typed_parameter_validation_messages$wrong_return_value_length,
      parameter_name,
      3
    )
  )
}

test_that("simulate_rigid_regression", {

  # Input validation ---

  expect_explanatory_points_validation()
  expect_rotation_matrix_validation()
  expect_local_error_sampler_validation()

  # Default use case scenario ---

  # Define a matrix of evaluation points.

  explanatory_points <- rbind(
    cbind(.5, 0, -.8660254),
    cbind(-.5, 0, -.8660254)
  )

  # Define a rotation matrix.

  rotation_matrix <- expm(
    get_skew_symmetric_matrix(
      cbind(-0.36, 0.48, -0.8)
    )
  )

  # Define an error sampler.

  local_error_sampler <- function(point) {
    -point
  }

  # Simulate the regression.

  actual <- simulate_rigid_regression(explanatory_points,
                                      rotation_matrix,
                                      local_error_sampler)

  # Assert

  x1 <- explanatory_points[1, ]
  e1 <- expm(get_skew_symmetric_matrix(local_error_sampler(x1)))
  r1 <- rotation_matrix
  y1 <- e1 %*% r1 %*% x1

  x2 <- explanatory_points[2, ]
  e2 <- expm(get_skew_symmetric_matrix(local_error_sampler(x2)))
  r2 <- rotation_matrix
  y2 <- e2 %*% r2 %*% x2

  expected <- matrix(
            nrow = 2,
            ncol = 3,
            data = c(y1, y2),
            byrow = TRUE)

  expect_equal(
        object = actual,
        expected = expected,
        tolerance = 1.0e-7)
})