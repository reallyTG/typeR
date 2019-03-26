library(nprotreg)
context("Regression Functions: cross_validate_concentration")

expect_concentration_upper_bound_validation <- function() {

  format_message <- parameter_validators$concentration_upper_bound$base_format_message
  parameter_name <- parameter_validators$concentration_upper_bound$name

  valid_data <-
    list(
      explanatory_points = matrix(0, nrow = 4, ncol = 3),
      response_points = matrix(0, nrow = 4, ncol = 3),
      weights_generator = weight_explanatory_points
    )

  # NULL ---

  concentration_upper_bound <- NULL

  expect_error(
    cross_validate_concentration(
      concentration_upper_bound = concentration_upper_bound,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      weights_generator = valid_data$weights_generator,
      number_of_expansion_terms = 1,
      number_of_iterations = 1
    ),
    format_message(
      formatting = parameter_validation_messages$cannot_be_null,
      parameter_name
    )
  )

  # non numeric ---

  concentration_upper_bound <- "string"

  expect_error(
    cross_validate_concentration(
      concentration_upper_bound = concentration_upper_bound,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      weights_generator = valid_data$weights_generator,
      number_of_expansion_terms = 1,
      number_of_iterations = 1
    ),
    format_message(
      formatting = parameter_validation_messages$must_be_numeric,
      parameter_name
    )
  )

  # non scalar ---

  concentration_upper_bound <- matrix(1, nrow = 2, ncol = 3)

  expect_error(
    cross_validate_concentration(
      concentration_upper_bound = concentration_upper_bound,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      weights_generator = valid_data$weights_generator,
      number_of_expansion_terms = 1,
      number_of_iterations = 1
    ),
    format_message(
      formatting = parameter_validation_messages$must_be_scalar,
      parameter_name
    )
  )

  # non positive ---

  concentration_upper_bound <- 0.0

  expect_error(
    cross_validate_concentration(
      concentration_upper_bound = concentration_upper_bound,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      weights_generator = valid_data$weights_generator,
      number_of_expansion_terms = 1,
      number_of_iterations = 1
    ),
    format_message(
      formatting = parameter_validation_messages$must_be_positive,
      parameter_name
    )
  )
}

expect_explanatory_points_validation <- function() {

  format_message <- parameter_validators$explanatory_points$base_format_message
  parameter_name <- parameter_validators$explanatory_points$name

  valid_data <-
    list(
      concentration_upper_bound = 1.0,
      response_points = matrix(0, nrow = 4, ncol = 3),
      weights_generator = weight_explanatory_points
    )

  # NULL ---

  explanatory_points <- NULL

  expect_error(
    cross_validate_concentration(
      concentration_upper_bound = valid_data$concentration_upper_bound,
      explanatory_points = explanatory_points,
      response_points = valid_data$response_points,
      weights_generator = valid_data$weights_generator,
      number_of_expansion_terms = 1,
      number_of_iterations = 1
    ),
    format_message(
      formatting = parameter_validation_messages$cannot_be_null,
      parameter_name
    )
  )

  # non numeric ---

  explanatory_points <- "string"

  expect_error(
    cross_validate_concentration(
      concentration_upper_bound = valid_data$concentration_upper_bound,
      explanatory_points = explanatory_points,
      response_points = valid_data$response_points,
      weights_generator = valid_data$weights_generator,
      number_of_expansion_terms = 1,
      number_of_iterations = 1
    ),
    format_message(
      formatting = parameter_validation_messages$must_be_numeric,
      parameter_name
    )
  )

  # non matrix ---

  explanatory_points <- vector(mode = "numeric", length = 2)

  expect_error(
    cross_validate_concentration(
      concentration_upper_bound = valid_data$concentration_upper_bound,
      explanatory_points = explanatory_points,
      response_points = valid_data$response_points,
      weights_generator = valid_data$weights_generator,
      number_of_expansion_terms = 1,
      number_of_iterations = 1
    ),
    format_message(
      formatting = parameter_validation_messages$must_be_matrix,
      parameter_name
    )
  )

  # number of columns other than 3 ---

  explanatory_points <- matrix(1, nrow = 4, ncol = 2)

  expect_error(
    cross_validate_concentration(
      concentration_upper_bound = valid_data$concentration_upper_bound,
      explanatory_points = explanatory_points,
      response_points = valid_data$response_points,
      weights_generator = valid_data$weights_generator,
      number_of_expansion_terms = 1,
      number_of_iterations = 1
    ),
    format_message(
      formatting = parameter_validation_messages$wrong_number_of_columns,
      parameter_name,
      3
    )
  )
}

expect_response_points_validation <- function() {

  format_message <- parameter_validators$response_points$base_format_message
  parameter_name <- parameter_validators$response_points$name

  valid_data <-
    list(
      concentration_upper_bound = 1.0,
      explanatory_points = matrix(0, nrow = 4, ncol = 3),
      weights_generator = weight_explanatory_points
    )

  # NULL ---

  response_points <- NULL

  expect_error(
    cross_validate_concentration(
      concentration_upper_bound = valid_data$concentration_upper_bound,
      explanatory_points = valid_data$explanatory_points,
      response_points = response_points,
      weights_generator = valid_data$weights_generator,
      number_of_expansion_terms = 1,
      number_of_iterations = 1
    ),
    format_message(
      formatting = parameter_validation_messages$cannot_be_null,
      parameter_name
    )
  )

  # non numeric ---

  response_points <- "string"

  expect_error(
    cross_validate_concentration(
      concentration_upper_bound = valid_data$concentration_upper_bound,
      explanatory_points = valid_data$explanatory_points,
      response_points = response_points,
      weights_generator = valid_data$weights_generator,
      number_of_expansion_terms = 1,
      number_of_iterations = 1
    ),
    format_message(
      formatting = parameter_validation_messages$must_be_numeric,
      parameter_name
    )
  )

  # non matrix ---

  response_points <- vector(mode = "numeric", length = 2)

  expect_error(
    cross_validate_concentration(
      concentration_upper_bound = valid_data$concentration_upper_bound,
      explanatory_points = valid_data$explanatory_points,
      response_points = response_points,
      weights_generator = valid_data$weights_generator,
      number_of_expansion_terms = 1,
      number_of_iterations = 1
    ),
    format_message(
      formatting = parameter_validation_messages$must_be_matrix,
      parameter_name
    )
  )

  # number of columns other than 3 ---

  response_points <- matrix(1, nrow = 4, ncol = 2)

  expect_error(
    cross_validate_concentration(
      concentration_upper_bound = valid_data$concentration_upper_bound,
      explanatory_points = valid_data$explanatory_points,
      response_points = response_points,
      weights_generator = valid_data$weights_generator,
      number_of_expansion_terms = 1,
      number_of_iterations = 1
    ),
    format_message(
      formatting = parameter_validation_messages$wrong_number_of_columns,
      parameter_name,
      3
    )
  )

  # number of rows other than the number of rows in explanatory_points ---

  response_points <- matrix(1, nrow = 8, ncol = 3)

  expect_error(
    cross_validate_concentration(
      concentration_upper_bound = valid_data$concentration_upper_bound,
      explanatory_points = valid_data$explanatory_points,
      response_points = response_points,
      weights_generator = valid_data$weights_generator,
      number_of_expansion_terms = 1,
      number_of_iterations = 1
    ),
    format_message(
      formatting = parameter_validation_messages$wrong_shared_number_of_rows,
      parameter_name,
      "explanatory_points"
    )
  )
}

expect_weights_generator_validation <- function() {

  format_message <- fnc_typed_parameter_validators$weights_generator$base_format_message
  parameter_name <- fnc_typed_parameter_validators$weights_generator$name

  valid_data <-
    list(
      concentration_upper_bound = 1.0,
      explanatory_points = matrix(0, nrow = 4, ncol = 3),
      response_points = matrix(0, nrow = 4, ncol = 3)
    )

  # NULL ---

  weights_generator <- NULL

  expect_error(
    cross_validate_concentration(
      concentration_upper_bound = valid_data$concentration_upper_bound,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      weights_generator = weights_generator,
      number_of_expansion_terms = 1,
      number_of_iterations = 1
    ),
    format_message(
      formatting = parameter_validation_messages$cannot_be_null,
      parameter_name
    )
  )

  # non function ---

  weights_generator <- "string"

  expect_error(
    cross_validate_concentration(
      concentration_upper_bound = valid_data$concentration_upper_bound,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      weights_generator = weights_generator,
      number_of_expansion_terms = 1,
      number_of_iterations = 1
    ),
    format_message(
      formatting = parameter_validation_messages$must_be_function,
      parameter_name
    )
  )

  # wrong number of parameters ---

  weights_generator <- function(first, second) {
    vector(mode = "numeric", length = 2)
  }

  expect_error(
    cross_validate_concentration(
      concentration_upper_bound = valid_data$concentration_upper_bound,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      weights_generator = weights_generator,
      number_of_expansion_terms = 1,
      number_of_iterations = 1
    ),
    format_message(
      formatting = fnc_typed_parameter_validation_messages$wrong_number_of_function_params,
      parameter_name,
      3
    )
  )

  # missing expected parameter: evaluation_points ---

  weights_generator <- function(
    first,
    explanatory_points,
    concentration
  ) {
    matrix(1, nrow = 6, ncol = 4)
  }

  expect_error(
    cross_validate_concentration(
      concentration_upper_bound = valid_data$concentration_upper_bound,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      weights_generator = weights_generator,
      number_of_expansion_terms = 1,
      number_of_iterations = 1
    ),
    format_message(
      formatting = fnc_typed_parameter_validation_messages$missing_function_param,
      parameter_name,
      "evaluation_points"
    )
  )

  # missing expected parameter: explanatory_points ---

  weights_generator <- function(
    evaluation_points,
    second,
    concentration
  ) {
    matrix(1, nrow = 6, ncol = 4)
  }

  expect_error(
    cross_validate_concentration(
      concentration_upper_bound = valid_data$concentration_upper_bound,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      weights_generator = weights_generator,
      number_of_expansion_terms = 1,
      number_of_iterations = 1
    ),
    format_message(
      formatting = fnc_typed_parameter_validation_messages$missing_function_param,
      parameter_name,
      "explanatory_points"
    )
  )

  # missing expected parameter: concentration ---

  weights_generator <- function(
    evaluation_points,
    explanatory_points,
    third
  ) {
    matrix(1, nrow = 6, ncol = 4)
  }

  expect_error(
    cross_validate_concentration(
      concentration_upper_bound = valid_data$concentration_upper_bound,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      weights_generator = weights_generator,
      number_of_expansion_terms = 1,
      number_of_iterations = 1
    ),
    format_message(
      formatting = fnc_typed_parameter_validation_messages$missing_function_param,
      parameter_name,
      "concentration"
    )
  )

  # return value is NULL ---

  weights_generator <- function(
    evaluation_points,
    explanatory_points,
    concentration) {
    NULL
  }

  expect_error(
    cross_validate_concentration(
      concentration_upper_bound = valid_data$concentration_upper_bound,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      weights_generator = weights_generator,
      number_of_expansion_terms = 1,
      number_of_iterations = 1
    ),
    format_message(
      formatting = fnc_typed_parameter_validation_messages$cannot_return_null,
      parameter_name
    )
  )

  # return value is non numeric ---

  weights_generator <- function(
    evaluation_points,
    explanatory_points,
    concentration) {
    "string"
  }

  expect_error(
    cross_validate_concentration(
      concentration_upper_bound = valid_data$concentration_upper_bound,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      weights_generator = weights_generator,
      number_of_expansion_terms = 1,
      number_of_iterations = 1
    ),
    format_message(
      formatting = fnc_typed_parameter_validation_messages$cannot_return_non_numeric,
      parameter_name
    )
  )

  # return value is non matrix ---

  weights_generator <- function(
    evaluation_points,
    explanatory_points,
    concentration) {
    vector(mode = "numeric", length = 2)
  }

  expect_error(
    cross_validate_concentration(
      concentration_upper_bound = valid_data$concentration_upper_bound,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      weights_generator = weights_generator,
      number_of_expansion_terms = 1,
      number_of_iterations = 1
    ),
    format_message(
      formatting = fnc_typed_parameter_validation_messages$cannot_return_non_matrix,
      parameter_name
    )
  )

  # return value has wrong rows ---

  weights_generator <- function(
    evaluation_points = matrix(1, nrow = 4, ncol = 3),
    explanatory_points = matrix(1, nrow = 5, ncol = 3),
    concentration = 1) {
    matrix(1, nrow = 6, ncol = 4)
  }

  expect_error(
    cross_validate_concentration(
      concentration_upper_bound = valid_data$concentration_upper_bound,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      weights_generator = weights_generator,
      number_of_expansion_terms = 1,
      number_of_iterations = 1
    ),
    format_message(
      formatting = fnc_typed_parameter_validation_messages$wrong_weights_return_value_dimensions,
      parameter_name
    )
  )

  # return value has wrong columns ---

  weights_generator <- function(
    evaluation_points = matrix(1, nrow = 4, ncol = 3),
    explanatory_points = matrix(1, nrow = 5, ncol = 3),
    concentration = 1) {
    matrix(1, nrow = 5, ncol = 2)
  }

  expect_error(
    cross_validate_concentration(
      concentration_upper_bound = valid_data$concentration_upper_bound,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      weights_generator = weights_generator,
      number_of_expansion_terms = 1,
      number_of_iterations = 1
    ),
    format_message(
      formatting = fnc_typed_parameter_validation_messages$wrong_weights_return_value_dimensions,
      parameter_name
    )
  )
}

expect_number_of_expansion_terms_validation <- function() {

  format_message <- parameter_validators$number_of_expansion_terms$base_format_message
  parameter_name <- parameter_validators$number_of_expansion_terms$name

  valid_data <-
    list(
      concentration_upper_bound = 1.0,
      explanatory_points = matrix(0, nrow = 4, ncol = 3),
      response_points = matrix(0, nrow = 4, ncol = 3),
      weights_generator = weight_explanatory_points
    )

  # NULL ---

  number_of_expansion_terms <- NULL

  expect_error(
    cross_validate_concentration(
      concentration_upper_bound = valid_data$concentration_upper_bound,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      weights_generator = valid_data$weights_generator,
      number_of_expansion_terms = number_of_expansion_terms,
      number_of_iterations = 1
    ),
    format_message(
      formatting = parameter_validation_messages$cannot_be_null,
      parameter_name
    )
  )

  # non numeric ---

  number_of_expansion_terms <- "string"

  expect_error(
    cross_validate_concentration(
      concentration_upper_bound = valid_data$concentration_upper_bound,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      weights_generator = valid_data$weights_generator,
      number_of_expansion_terms = number_of_expansion_terms,
      number_of_iterations = 1
    ),
    format_message(
      formatting = parameter_validation_messages$must_be_numeric,
      parameter_name
    )
  )

  # non scalar ---

  number_of_expansion_terms <- matrix(1, nrow = 2, ncol = 3)

  expect_error(
    cross_validate_concentration(
      concentration_upper_bound = valid_data$concentration_upper_bound,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      weights_generator = valid_data$weights_generator,
      number_of_expansion_terms = number_of_expansion_terms,
      number_of_iterations = 1
    ),
    format_message(
      formatting = parameter_validation_messages$must_be_scalar,
      parameter_name
    )
  )

  # non integer ---

  number_of_expansion_terms <- 2.1

  expect_error(
    cross_validate_concentration(
      concentration_upper_bound = valid_data$concentration_upper_bound,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      weights_generator = valid_data$weights_generator,
      number_of_expansion_terms = number_of_expansion_terms,
      number_of_iterations = 1
    ),
    format_message(
      formatting = parameter_validation_messages$must_be_integer,
      parameter_name
    )
  )

  # less than 1 ---

  number_of_expansion_terms <- 0

  expect_error(
    cross_validate_concentration(
      concentration_upper_bound = valid_data$concentration_upper_bound,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      weights_generator = valid_data$weights_generator,
      number_of_expansion_terms = number_of_expansion_terms,
      number_of_iterations = 1
    ),
    format_message(
      formatting = parameter_validation_messages$must_be_in_range,
      parameter_name,
      1,
      2
    ), fixed = TRUE # Needed to take into account chars '[' and ']'
  )

  # greater than 2 ---

  number_of_expansion_terms <- 3

  expect_error(
    cross_validate_concentration(
      concentration_upper_bound = valid_data$concentration_upper_bound,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      weights_generator = valid_data$weights_generator,
      number_of_expansion_terms = number_of_expansion_terms,
      number_of_iterations = 1
    ),
    format_message(
      formatting = parameter_validation_messages$must_be_in_range,
      parameter_name,
      1,
      2
    ), fixed = TRUE # Needed to take into account chars '[' and ']'
  )
}

expect_number_of_iterations_validation <- function() {

  format_message <- parameter_validators$number_of_iterations$base_format_message
  parameter_name <- parameter_validators$number_of_iterations$name

  valid_data <-
    list(
      concentration_upper_bound = 1.0,
      explanatory_points = matrix(0, nrow = 4, ncol = 3),
      response_points = matrix(0, nrow = 4, ncol = 3),
      weights_generator = weight_explanatory_points
    )

  # NULL ---

  number_of_iterations <- NULL

  expect_error(
    cross_validate_concentration(
      concentration_upper_bound = valid_data$concentration_upper_bound,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      weights_generator = valid_data$weights_generator,
      number_of_expansion_terms = 1,
      number_of_iterations = number_of_iterations
    ),
    format_message(
      formatting = parameter_validation_messages$cannot_be_null,
      parameter_name
    )
  )

  # non numeric ---

  number_of_iterations <- "string"

  expect_error(
    cross_validate_concentration(
      concentration_upper_bound = valid_data$concentration_upper_bound,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      weights_generator = valid_data$weights_generator,
      number_of_expansion_terms = 1,
      number_of_iterations = number_of_iterations
    ),
    format_message(
      formatting = parameter_validation_messages$must_be_numeric,
      parameter_name
    )
  )

  # non scalar ---

  number_of_iterations <- matrix(1, nrow = 2, ncol = 3)

  expect_error(
    cross_validate_concentration(
      concentration_upper_bound = valid_data$concentration_upper_bound,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      weights_generator = valid_data$weights_generator,
      number_of_expansion_terms = 1,
      number_of_iterations = number_of_iterations
    ),
    format_message(
      formatting = parameter_validation_messages$must_be_scalar,
      parameter_name
    )
  )

  # non integer ---

  number_of_iterations <- 2.1

  expect_error(
    cross_validate_concentration(
      concentration_upper_bound = valid_data$concentration_upper_bound,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      weights_generator = valid_data$weights_generator,
      number_of_expansion_terms = 1,
      number_of_iterations = number_of_iterations
    ),
    format_message(
      formatting = parameter_validation_messages$must_be_integer,
      parameter_name
    )
  )

  # non positive ---

  number_of_iterations <- 0

  expect_error(
    cross_validate_concentration(
      concentration_upper_bound = valid_data$concentration_upper_bound,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      weights_generator = valid_data$weights_generator,
      number_of_expansion_terms = 1,
      number_of_iterations = number_of_iterations
    ),
    format_message(
      formatting = parameter_validation_messages$must_be_positive,
      parameter_name
    )
  )
}

expect_allow_reflections_validation <- function() {

  format_message <- parameter_validators$allow_reflections$base_format_message
  parameter_name <- parameter_validators$allow_reflections$name

  valid_data <-
    list(
      concentration_upper_bound = 1.0,
      explanatory_points = matrix(0, nrow = 4, ncol = 3),
      response_points = matrix(0, nrow = 4, ncol = 3),
      weights_generator = weight_explanatory_points
    )

  # NULL ---

  allow_reflections <- NULL

  expect_error(
    cross_validate_concentration(
      concentration_upper_bound = valid_data$concentration_upper_bound,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      weights_generator = valid_data$weights_generator,
      number_of_expansion_terms = 1,
      number_of_iterations = 1,
      allow_reflections = allow_reflections
    ),
    format_message(
      formatting = parameter_validation_messages$cannot_be_null,
      parameter_name
    )
  )

  # non logical ---

  allow_reflections <- "s"

  expect_error(
    cross_validate_concentration(
      concentration_upper_bound = valid_data$concentration_upper_bound,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      weights_generator = valid_data$weights_generator,
      number_of_expansion_terms = 1,
      number_of_iterations = 1,
      allow_reflections = allow_reflections
    ),
    format_message(
      formatting = parameter_validation_messages$must_be_logical,
      parameter_name
    )
  )

  # non scalar ---

  allow_reflections <- vector(length = 2)

  expect_error(
    cross_validate_concentration(
      concentration_upper_bound = valid_data$concentration_upper_bound,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      weights_generator = valid_data$weights_generator,
      number_of_expansion_terms = 1,
      number_of_iterations = 1,
      allow_reflections = allow_reflections
    ),
    format_message(
      formatting = parameter_validation_messages$must_be_scalar,
      parameter_name
    )
  )
}

test_that("cross_validate_concentration", {

  # Input validation ---

  expect_concentration_upper_bound_validation()
  expect_explanatory_points_validation()
  expect_response_points_validation()
  expect_weights_generator_validation()
  expect_number_of_expansion_terms_validation()
  expect_number_of_iterations_validation()
  expect_allow_reflections_validation()

  # Default use case scenario ---

  skip_on_cran()

  # Define a matrix of evaluation points.

  explanatory_points <- get_equally_spaced_points(20)

  # Define a rotation matrix.

  rotation_matrix <- expm(
    get_skew_symmetric_matrix(
      cbind(-0.36, 0.48, -0.8)
    )
  )

  # Define an error sampler.

  local_error_sampler <- function(point) {
    c(0, 0, 0)
  }

  # Simulate a rigid regression.

  response_points <- simulate_rigid_regression(
    explanatory_points,
    rotation_matrix,
    local_error_sampler
  )

  # Cross-validate concentration

  cv_info <- cross_validate_concentration(
    concentration_upper_bound = 1.0,
    explanatory_points = explanatory_points,
    response_points = response_points
  )

  # Assert

  expected_concentration <- .71

  expect_equal(
        object = cv_info$concentration,
        expected = expected_concentration,
        tolerance = 1.0e-1)

  expected_objective <- 1.41e-31

  expect_equal(
        object = cv_info$objective,
        expected = expected_objective,
        tolerance = 1.0e-1)
})