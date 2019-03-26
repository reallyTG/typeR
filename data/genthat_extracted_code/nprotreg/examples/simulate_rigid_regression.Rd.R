library(nprotreg)


### Name: simulate_rigid_regression
### Title: Simulates a Rigid 3D Spherical Regression.
### Aliases: simulate_rigid_regression

### ** Examples

library(nprotreg)
library(expm)

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

# Define a rotation matrix.

rotation_matrix <- expm(
  get_skew_symmetric_matrix(
    cbind(-0.36, 0.48, -0.8)
  )
)

# Define a local error sampler.

local_error_sampler <- function(point) {
  rnorm(3)
}

# Get the corresponding 8-by-3 matrix of response points.
# Rows corresponds to explanatory points,
# columns to Cartesian coordinates.

response_points <- simulate_rigid_regression(explanatory_points,
                                             rotation_matrix,
                                             local_error_sampler)

# Get the response point corresponding to the second
# explanatory point.

cat("Response point corresponding to the second explanatory point: \n")
cat(response_points[2, ])



