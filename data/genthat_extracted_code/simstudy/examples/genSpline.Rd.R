library(simstudy)


### Name: genSpline
### Title: Generate spline curves
### Aliases: genSpline

### ** Examples

ddef <- defData(varname = "age", formula = "0;1", dist = "uniform")

theta1 = c(0.1, 0.8, 0.6, 0.4, 0.6, 0.9, 0.9)
knots <- c(0.25, 0.5, 0.75)

viewSplines(knots = knots, theta = theta1, degree = 3)

set.seed(234)
dt <- genData(1000, ddef)

dt <- genSpline(dt = dt, newvar = "weight",
                predictor = "age", theta = theta1,
                knots = knots, degree = 3,
                noise.var = .025)

dt




