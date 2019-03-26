library(nprotreg)


### Name: simulate_regression
### Title: Simulates a 3D Spherical Regression.
### Aliases: simulate_regression

### ** Examples

library(nprotreg)

# Define a matrix of explanatory points.

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

# Define a local rotation composer.

local_rotation_composer <- function(point) {
  independent_components <- (1 / 2) *
    c(exp(2.0 * point[3]), - exp(2.0 * point[2]), exp(2.0 * point[1]))
}

# Define a local error sampler.

local_error_sampler <- function(point) {
  rnorm(3)
}

# Get the corresponding 8-by-3 matrix of response points.
# Rows corresponds to explanatory points,
# columns to Cartesian coordinates.

response_points <- simulate_regression(explanatory_points,
                                       local_rotation_composer,
                                       local_error_sampler)

# Get the response point corresponding to the second
# explanatory point.

cat("Response point corresponding to the second explanatory point: \n")
cat(response_points[2, ])



