library(patrick)


### Name: with_parameters_test_that
### Title: Execute a test with parameters.
### Aliases: with_parameters_test_that cases

### ** Examples

with_parameters_test_that("trigonometric functions match identities", {
    testthat::expect_equal(expr, numeric_value)
  },
  expr = c(sin(pi / 4), cos(pi / 4), tan(pi / 4)),
  numeric_value = c(1 / sqrt(2), 1 / sqrt(2), 1)
)

# Run the same test with the cases() constructor
with_parameters_test_that("trigonometric functions match identities", {
    testthat::expect_equal(expr, numeric_value)
  },
  cases(
    sin = list(expr = sin(pi / 4), numeric_value = 1 / sqrt(2)),
    cos = list(expr = cos(pi / 4), numeric_value = 1 / sqrt(2)),
    tan = list(expr = tan(pi / 4), numeric_value = 1)
  )
)



