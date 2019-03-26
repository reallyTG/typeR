library(geex)


### Name: grab_design_matrix
### Title: Grab a matrix of fixed effects from a model object
### Aliases: grab_design_matrix

### ** Examples

# Create a "desigm" matrix for the first ten rows of iris data
fit <- lm(Sepal.Width ~ Petal.Width, data = iris)
grab_design_matrix(
  data = iris[1:10, ],
  grab_fixed_formula(fit))



