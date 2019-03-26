library(nprotreg)
context("Regression Functions: fit_regression")

expect_evaluation_points_validation <- function() {

  format_message <- parameter_validators$evaluation_points$base_format_message
  parameter_name <- parameter_validators$evaluation_points$name

  valid_data <-
    list(
      explanatory_points = matrix(0, nrow = 4, ncol = 3),
      response_points = matrix(0, nrow = 4, ncol = 3),
      concentration = 1,
      weights_generator = weight_explanatory_points
    )

  # NULL ---

  evaluation_points <- NULL

  expect_error(
    fit_regression(
      evaluation_points = evaluation_points,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      concentration = valid_data$concentration,
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

  evaluation_points <- "string"

  expect_error(
    fit_regression(
      evaluation_points = evaluation_points,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      concentration = valid_data$concentration,
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

  evaluation_points <- vector(mode = "numeric", length = 2)

  expect_error(
    fit_regression(
      evaluation_points = evaluation_points,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      concentration = valid_data$concentration,
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

  evaluation_points <- matrix(1, nrow = 4, ncol = 2)

  expect_error(
    fit_regression(
      evaluation_points = evaluation_points,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      concentration = valid_data$concentration,
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

expect_explanatory_points_validation <- function() {

  format_message <- parameter_validators$explanatory_points$base_format_message
  parameter_name <- parameter_validators$explanatory_points$name

  valid_data <-
    list(
      evaluation_points = matrix(0, nrow = 5, ncol = 3),
      response_points = matrix(0, nrow = 4, ncol = 3),
      concentration = 1,
      weights_generator = weight_explanatory_points
    )

  # NULL ---

  explanatory_points <- NULL

  expect_error(
    fit_regression(
      evaluation_points = valid_data$evaluation_points,
      explanatory_points = explanatory_points,
      response_points = valid_data$response_points,
      concentration = valid_data$concentration,
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
    fit_regression(
      evaluation_points = valid_data$evaluation_points,
      explanatory_points = explanatory_points,
      response_points = valid_data$response_points,
      concentration = valid_data$concentration,
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
    fit_regression(
      evaluation_points = valid_data$evaluation_points,
      explanatory_points = explanatory_points,
      response_points = valid_data$response_points,
      concentration = valid_data$concentration,
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
    fit_regression(
      evaluation_points = valid_data$evaluation_points,
      explanatory_points = explanatory_points,
      response_points = valid_data$response_points,
      concentration = valid_data$concentration,
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
      evaluation_points = matrix(0, nrow = 5, ncol = 3),
      explanatory_points = matrix(0, nrow = 4, ncol = 3),
      concentration = 1,
      weights_generator = weight_explanatory_points
    )

  # NULL ---

  response_points <- NULL

  expect_error(
    fit_regression(
      evaluation_points = valid_data$evaluation_points,
      explanatory_points = valid_data$explanatory_points,
      response_points = response_points,
      concentration = valid_data$concentration,
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
    fit_regression(
      evaluation_points = valid_data$evaluation_points,
      explanatory_points = valid_data$explanatory_points,
      response_points = response_points,
      concentration = valid_data$concentration,
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
    fit_regression(
      evaluation_points = valid_data$evaluation_points,
      explanatory_points = valid_data$explanatory_points,
      response_points = response_points,
      concentration = valid_data$concentration,
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
    fit_regression(
      evaluation_points = valid_data$evaluation_points,
      explanatory_points = valid_data$explanatory_points,
      response_points = response_points,
      concentration = valid_data$concentration,
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
    fit_regression(
      evaluation_points = valid_data$evaluation_points,
      explanatory_points = valid_data$explanatory_points,
      response_points = response_points,
      concentration = valid_data$concentration,
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

expect_concentration_validation <- function() {

  format_message <- parameter_validators$concentration$base_format_message
  parameter_name <- parameter_validators$concentration$name

  valid_data <-
    list(
      evaluation_points = matrix(0, nrow = 5, ncol = 3),
      explanatory_points = matrix(0, nrow = 4, ncol = 3),
      response_points = matrix(0, nrow = 4, ncol = 3),
      weights_generator = weight_explanatory_points
    )

  # NULL ---

  concentration <- NULL

  expect_error(
    fit_regression(
      evaluation_points = valid_data$evaluation_points,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      concentration = concentration,
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

  concentration <- "string"

  expect_error(
    fit_regression(
      evaluation_points = valid_data$evaluation_points,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      concentration = concentration,
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

  concentration <- matrix(1, nrow = 2, ncol = 3)

  expect_error(
    fit_regression(
      evaluation_points = valid_data$evaluation_points,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      concentration = concentration,
      weights_generator = valid_data$weights_generator,
      number_of_expansion_terms = 1,
      number_of_iterations = 1
    ),
    format_message(
      formatting = parameter_validation_messages$must_be_scalar,
      parameter_name
    )
  )

  # negative ---

  concentration <- -1.0

  expect_error(
    fit_regression(
      evaluation_points = valid_data$evaluation_points,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      concentration = concentration,
      weights_generator = valid_data$weights_generator,
      number_of_expansion_terms = 1,
      number_of_iterations = 1
    ),
    format_message(
      formatting = parameter_validation_messages$must_be_non_negative,
      parameter_name
    )
  )
}

expect_weights_generator_validation <- function() {

  format_message <- fnc_typed_parameter_validators$weights_generator$base_format_message
  parameter_name <- fnc_typed_parameter_validators$weights_generator$name

  valid_data <-
    list(
      evaluation_points = matrix(0, nrow = 5, ncol = 3),
      explanatory_points = matrix(0, nrow = 4, ncol = 3),
      response_points = matrix(0, nrow = 4, ncol = 3),
      concentration = 1.0
    )

  # NULL ---

  weights_generator <- NULL

  expect_error(
    fit_regression(
      evaluation_points = valid_data$evaluation_points,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      concentration = valid_data$concentration,
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
    fit_regression(
      evaluation_points = valid_data$evaluation_points,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      concentration = valid_data$concentration,
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
    fit_regression(
      evaluation_points = valid_data$evaluation_points,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      concentration = valid_data$concentration,
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
    fit_regression(
      evaluation_points = valid_data$evaluation_points,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      concentration = valid_data$concentration,
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
    fit_regression(
      evaluation_points = valid_data$evaluation_points,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      concentration = valid_data$concentration,
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
    fit_regression(
      evaluation_points = valid_data$evaluation_points,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      concentration = valid_data$concentration,
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
    fit_regression(
      evaluation_points = valid_data$evaluation_points,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      concentration = valid_data$concentration,
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
    fit_regression(
      evaluation_points = valid_data$evaluation_points,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      concentration = valid_data$concentration,
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
    fit_regression(
      evaluation_points = valid_data$evaluation_points,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      concentration = valid_data$concentration,
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
    fit_regression(
      evaluation_points = valid_data$evaluation_points,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      concentration = valid_data$concentration,
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
    fit_regression(
      evaluation_points = valid_data$evaluation_points,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      concentration = valid_data$concentration,
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
      evaluation_points = matrix(0, nrow = 5, ncol = 3),
      explanatory_points = matrix(0, nrow = 4, ncol = 3),
      response_points = matrix(0, nrow = 4, ncol = 3),
      concentration = 1,
      weights_generator = weight_explanatory_points
    )

  # NULL ---

  number_of_expansion_terms <- NULL

  expect_error(
    fit_regression(
      evaluation_points = valid_data$evaluation_points,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      concentration = valid_data$concentration,
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
    fit_regression(
      evaluation_points = valid_data$evaluation_points,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      concentration = valid_data$concentration,
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
    fit_regression(
      evaluation_points = valid_data$evaluation_points,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      concentration = valid_data$concentration,
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
    fit_regression(
      evaluation_points = valid_data$evaluation_points,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      concentration = valid_data$concentration,
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
    fit_regression(
      evaluation_points = valid_data$evaluation_points,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      concentration = valid_data$concentration,
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
    fit_regression(
      evaluation_points = valid_data$evaluation_points,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      concentration = valid_data$concentration,
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
      evaluation_points = matrix(0, nrow = 5, ncol = 3),
      explanatory_points = matrix(0, nrow = 4, ncol = 3),
      response_points = matrix(0, nrow = 4, ncol = 3),
      concentration = 1,
      weights_generator = weight_explanatory_points
    )

  # NULL ---

  number_of_iterations <- NULL

  expect_error(
    fit_regression(
      evaluation_points = valid_data$evaluation_points,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      concentration = valid_data$concentration,
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
    fit_regression(
      evaluation_points = valid_data$evaluation_points,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      concentration = valid_data$concentration,
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
    fit_regression(
      evaluation_points = valid_data$evaluation_points,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      concentration = valid_data$concentration,
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
    fit_regression(
      evaluation_points = valid_data$evaluation_points,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      concentration = valid_data$concentration,
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
    fit_regression(
      evaluation_points = valid_data$evaluation_points,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      concentration = valid_data$concentration,
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
      evaluation_points = matrix(0, nrow = 5, ncol = 3),
      explanatory_points = matrix(0, nrow = 4, ncol = 3),
      response_points = matrix(0, nrow = 4, ncol = 3),
      concentration = 1,
      weights_generator = weight_explanatory_points
    )

  # NULL ---

  allow_reflections <- NULL

  expect_error(
    fit_regression(
      evaluation_points = valid_data$evaluation_points,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      concentration = valid_data$concentration,
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
    fit_regression(
      evaluation_points = valid_data$evaluation_points,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      concentration = valid_data$concentration,
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
    fit_regression(
      evaluation_points = valid_data$evaluation_points,
      explanatory_points = valid_data$explanatory_points,
      response_points = valid_data$response_points,
      concentration = valid_data$concentration,
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

test_that("fit_regression", {

  # Input validation ---

  expect_evaluation_points_validation()
  expect_explanatory_points_validation()
  expect_response_points_validation()
  expect_concentration_validation()
  expect_weights_generator_validation()
  expect_number_of_expansion_terms_validation()
  expect_number_of_iterations_validation()
  expect_allow_reflections_validation()

  # Default use case scenario ---

  # Define a matrix of evaluation points.

  evaluation_points <- rbind(
    cbind(.5, 0, -.8660254),
    cbind(-.5, 0, -.8660254)
  )

  # Define a matrix of explanatory points.

  explanatory_points <- get_equally_spaced_points(20)

  # Define a matrix of response points by simulation.

  local_rotation_composer <- function(point) {
    independent_components <- (1 / 2) *
    c(exp(2.0 * point[3]), - exp(2.0 * point[2]), exp(2.0 * point[1]))
  }

  local_error_sampler <- function(point) {
    rnorm(3)
  }

  response_points <- simulate_regression(
    explanatory_points,
    local_rotation_composer,
    local_error_sampler
  )

  # Use a default weights generator.

  weights_generator <- weight_explanatory_points

  # Set the concentration parameter.

  concentration <- 5

  # fit the regression.

  #  A. number_of_expansion_terms = 1, number_of_iterations = 1

  actual <- fit_regression(
    evaluation_points,
    explanatory_points,
    response_points,
    concentration,
    weights_generator,
    number_of_expansion_terms = 1,
    number_of_iterations = 1
  )

  # Assert

  explanatory_point_weights <- weights_generator(
    evaluation_points,
    explanatory_points,
    concentration
  )

  e <- explanatory_points
  yT <- t(response_points)

  x1 <- evaluation_points[1, ]
  w1 <- explanatory_point_weights[, 1]
  svd_info1 <- svd(yT %*% diag(w1) %*% e)
  u1 <- svd_info1$u
  transposed_v1 <- t(svd_info1$v)
  r1 <- u1 %*% diag(c(1, 1, det(u1 %*% transposed_v1))) %*% transposed_v1
  y1 <- t(r1 %*% x1)

  x2 <- evaluation_points[2, ]
  w2 <- explanatory_point_weights[, 2]
  svd_info2 <- svd(yT %*% diag(w2) %*% e)
  u2 <- svd_info2$u
  transposed_v2 <- t(svd_info2$v)
  r2 <- u2 %*% diag(c(1, 1, det(u2 %*% transposed_v2))) %*% transposed_v2
  y2 <- t(r2 %*% x2)

  expected <- matrix(
            nrow = 2,
            ncol = 3,
            data = c(y1, y2),
            byrow = TRUE)

  expect_equal(
        object = actual[[1]]$fitted_response_points,
        expected = expected,
        tolerance = 1.0e-7)
})