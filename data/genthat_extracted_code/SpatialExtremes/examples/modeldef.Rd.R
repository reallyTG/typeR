library(SpatialExtremes)


### Name: modeldef
### Title: Define a model for the spatial behaviour of the GEV parameters
### Aliases: modeldef modeldef.lm modeldef.rb
### Keywords: design

### ** Examples

## 1- A design matrix from a classical linear model 
n.site <- 5
coord <- matrix(rnorm(2*n.site, sd = sqrt(.2)), ncol = 2)
colnames(coord) <- c("lon", "lat")
loc.form <- loc ~ lat + I(lon^2)
modeldef(coord, loc.form)

## 2- A design and penalization matrix from a penalized smoothin spline
x <- sort(runif(10, -2, 10))
n.knots <- 3
knots <- quantile(x, prob = 1:n.knots / (n.knots + 2))
modeldef(x, y ~ rb(x, knots = knots, degree = 3, penalty = 1))



