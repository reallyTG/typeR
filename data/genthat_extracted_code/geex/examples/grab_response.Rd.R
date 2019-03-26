library(geex)


### Name: grab_response
### Title: Grab a vector of responses from a model object
### Aliases: grab_response

### ** Examples

# Grab vector of responses for the first ten rows of iris data
fit <- lm(Sepal.Width ~ Petal.Width, data = iris)
grab_response(
  data = iris[1:10, ],
  formula(fit))



