library(nprotreg)


### Name: weight_explanatory_points
### Title: Weights the Specified Explanatory Points in a 3D Spherical
###   Regression.
### Aliases: weight_explanatory_points

### ** Examples

library(nprotreg)

# Define a matrix of evaluation points.

north_pole <- cbind(0, 0, 1)
south_pole <- cbind(0, 0, -1)
evaluation_points <- rbind(north_pole, south_pole)

# Define a matrix of explanatory points

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

# Define a value for the concentration parameter.

concentration <- 1.0

# Get the corresponding 8-by-2 matrix of weights.
# Columns corresponds to evaluation points,
# rows to explanatory ones.

weights <- weight_explanatory_points(evaluation_points,
                                     explanatory_points,
                                     concentration)

# Get the weights assigned to the explanatory points
# while analyzing the second evaluation point.

cat("Weights assigned while analyzing the second evaluation point: \n")
cat(weights[, 2])



