library(nprotreg)


### Name: cross_validate_concentration
### Title: Cross-validates The Concentration Parameter In A 3D Spherical
###   Regression.
### Aliases: cross_validate_concentration

### ** Examples

library(nprotreg)

# Define a matrix of explanatory points.

number_of_explanatory_points <- 50

explanatory_points <- get_equally_spaced_points(
  number_of_explanatory_points)

# Define a matrix of response points by simulation.

local_rotation_composer <- function(point) {
  independent_components <- (1 / 2) *
    c(exp(2.0 * point[3]), - exp(2.0 * point[2]), exp(2.0 * point[1]))
}

local_error_sampler <- function(point) {
  rnorm(3)
}

response_points <- simulate_regression(explanatory_points,
                                       local_rotation_composer,
                                       local_error_sampler)

# Define an upper bound for concentration.

concentration_upper_bound <- 1

# Use default weights generator.

weights_generator <- weight_explanatory_points

# Cross-validate concentration parameter.

cv_info <- cross_validate_concentration(
  concentration_upper_bound,
  explanatory_points,
  response_points,
  weights_generator,
  number_of_expansion_terms = 1,
  number_of_iterations = 2,
  allow_reflections = FALSE
)

# Get the cross-validated concentration value.

cat("cross-validated concentration value: \n")
print(cv_info$concentration)



