library(nprotreg)


### Name: fit_regression
### Title: Fits a 3D Spherical Regression.
### Aliases: fit_regression

### ** Examples

library(nprotreg)

# Create 100 equally spaced design points on the sphere.

number_of_explanatory_points <- 100

explanatory_points <- get_equally_spaced_points(
  number_of_explanatory_points
)

# Define the regression model, where the rotation for a given "point"
# is obtained from the exponential of a skew-symmetric matrix with the
# following components.

local_rotation_composer <- function(point) {
  independent_components <- (1 / 8) *
    c(exp(2.0 * point[3]), - exp(2.0 * point[2]), exp(2.0 * point[1]))
}

# Define an error term given by a small rotation, similarly defined
# from a skew-symmetric matrix with random entries.

local_error_sampler <- function(point) {
  rnorm(3, sd = .01)
}

# Generate the matrix of responses, using the regression model
# and the error model.

response_points <- simulate_regression(
  explanatory_points,
  local_rotation_composer,
  local_error_sampler
)

# Create some "test data" for which the response will be predicted.

evaluation_points <- rbind(
  cbind(.5, 0, .8660254),
  cbind(-.5, 0, .8660254),
  cbind(1, 0, 0),
  cbind(0, 1, 0),
  cbind(-1, 0, 0),
  cbind(0, -1, 0),
  cbind(.5, 0, -.8660254),
  cbind(-.5, 0, -.8660254)
)

# Define a weight function for nonparametric fit.

weights_generator <- weight_explanatory_points

# Set the concentration parameter.

concentration <- 5

# Or obtain this by cross-validation: see
# the `cross_validate_concentration` function.

# Fit regression.

fitted_model <- fit_regression(
  evaluation_points,
  explanatory_points,
  response_points,
  concentration,
  weights_generator,
  number_of_expansion_terms = 1,
  number_of_iterations = 2
)

# Extract the point corresponding to the
# second evaluation point fitted at
# the first iteration.

cat("Point fitted at iteration 1 corresponding to the second evaluation point: \n")
cat(fitted_model[[1]]$fitted_response_points[2, ])

## Not run: 
##D # Create some plots to view the results.
##D 
##D # 3D plot.
##D 
##D library(rgl)
##D 
##D plot3d(
##D   explanatory_points,
##D   type = "n",
##D   xlab = "x",
##D   ylab = "y",
##D   zlab = "z",
##D   box = TRUE,
##D   axes = TRUE
##D )
##D spheres3d(0, 0, 0, radius = 1, lit = FALSE, color = "white")
##D spheres3d(0, 0, 0, radius = 1.01, lit = FALSE, color = "black", front = "culled")
##D text3d(c(0, 0, 1), text = "N", adj = 0)
##D 
##D ll <- 10
##D vv1 <- (ll - (0:(ll))) / ll
##D vv2 <- 1 - vv1
##D plot3d(explanatory_points, add = TRUE, col = 2)
##D for (i in 1:dim(explanatory_points)[1]) {
##D   m <- outer(vv1, explanatory_points[i,], "*") +
##D     outer(vv2, response_points[i,], "*")
##D   m <- m / sqrt(apply(m ^ 2, 1, sum))
##D   lines3d(m, col = 3)
##D }
##D 
##D plot3d(evaluation_points, add = TRUE, col = 4)
##D 
##D for (i in 1:dim(evaluation_points)[1]) {
##D   m <- outer(vv1, evaluation_points[i,], "*") +
##D     outer(vv2, fitted_model[[1]]$fitted_response_points[i,], "*")
##D   m <- m / sqrt(apply(m ^ 2, 1, sum))
##D   lines3d(m, col = 1)
##D }
##D 
##D # 2D plot.
##D 
##D explanatory_spherical_coords <- convert_cartesian_to_spherical(explanatory_points)
##D response_spherical_coords <- convert_cartesian_to_spherical(response_points)
##D 
##D plot(
##D   x = explanatory_spherical_coords[, 1],
##D   y = explanatory_spherical_coords[, 2],
##D   pch = 20,
##D   cex = .7,
##D   col = 2,
##D   xlab = "longitude",
##D   ylab = "latitude"
##D )
##D 
##D for (i in 1:dim(explanatory_spherical_coords)[1]) {
##D   column <- 1
##D   if ((explanatory_spherical_coords[i, 1] - response_spherical_coords[i, 1]) ^ 2 +
##D       (explanatory_spherical_coords[i, 2] - response_spherical_coords[i, 2]) ^ 2 > 4)
##D         column <- "grey"
##D   lines(
##D     c(explanatory_spherical_coords[i, 1], response_spherical_coords[i, 1]),
##D     c(explanatory_spherical_coords[i, 2], response_spherical_coords[i, 2]),
##D     col = column
##D   )
##D }
##D 
##D evaluation_spherical_coords <- convert_cartesian_to_spherical(
##D   evaluation_points
##D )
##D 
##D fitted_response_spherical_coords <- convert_cartesian_to_spherical(
##D   fitted_model[[1]]$fitted_response_points
##D )
##D 
##D points(
##D   x = evaluation_spherical_coords[, 1],
##D   y = evaluation_spherical_coords[, 2],
##D   pch = 20,
##D   cex = .7,
##D   col = 4
##D )
##D 
##D for (i in 1:dim(evaluation_spherical_coords)[1]) {
##D   column <- 3
##D   if ((evaluation_spherical_coords[i, 1] - fitted_response_spherical_coords[i, 1]) ^ 2 +
##D       (evaluation_spherical_coords[i, 2] - fitted_response_spherical_coords[i, 2]) ^ 2 > 4)
##D         column <- "grey"
##D   lines(
##D     c(evaluation_spherical_coords[i, 1], fitted_response_spherical_coords[i, 1]),
##D     c(evaluation_spherical_coords[i, 2], fitted_response_spherical_coords[i, 2]),
##D     col = column
##D   )
##D }
##D 
## End(Not run) 



