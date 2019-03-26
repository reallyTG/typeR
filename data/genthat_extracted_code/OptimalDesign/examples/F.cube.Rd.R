library(OptimalDesign)


### Name: F.cube
### Title: Model matrix on a cube
### Aliases: F.cube

### ** Examples

# The matrix of regressors for the trigonometric model of the second 
# degree on the "full circle" discretized to 24 equidistant points.
F.cube(~I(cos(x1)) + I(sin(x1)) + I(cos(2*x1)) + I(sin(2*x1)), 
       0, (46 / 24) * pi, 24)

# The matrix of regressors of the cubic model on a discretized 
# interval [-1,1].
F.cube(~x1 + I(x1^2) + I(x1^3), -1, 1, 21)

# The matrix of regressors of the 3-factor model with the intercept, 
# the linear and the second-order interaction terms; 
# the first 2 factors have levels -1, 0, 1, and the third factor has 
# levels -1, 0.5, 0, 0.5, 1.
F.cube(~x1*x2 + x1*x3 + x2*x3, rep(-1, 3), rep(1, 3), c(3, 3, 5))



