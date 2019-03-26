library(lfl)


### Name: triangle
### Title: Compute membership degrees of values to the fuzzy set
### Aliases: triangle raisedcos
### Keywords: models robust multivariate

### ** Examples

plot(function(x) triangle(x, -1, 0, 1), from=-2, to=3)
plot(function(x) triangle(x, -1, 0, 2), from=-2, to=3)
plot(function(x) triangle(x, -Inf, 0, 1), from=-2, to=3)
plot(function(x) triangle(x, -1, 0, Inf), from=-2, to=3)

plot(function(x) raisedcos(x, -1, 0, 1), from=-2, to=3)
plot(function(x) raisedcos(x, -1, 0, 2), from=-2, to=3)
plot(function(x) raisedcos(x, -Inf, 0, 1), from=-2, to=3)
plot(function(x) raisedcos(x, -1, 0, Inf), from=-2, to=3)



