library(simstudy)


### Name: viewSplines
### Title: Plot spline curves
### Aliases: viewSplines

### ** Examples

knots <- c(0.25, 0.5, 0.75)
theta1 = c(0.1, 0.8, 0.4, 0.9, 0.2, 1.0)

viewSplines(knots, degree = 2, theta1)

theta2 = matrix(c(0.1, 0.2, 0.4, 0.9, 0.2, 0.3,
                  0.1, 0.3, 0.3, 0.8, 1.0, 0.9,
                  0.1, 0.4, 0.3, 0.8, 0.7, 0.5,
                  0.1, 0.9, 0.8, 0.2, 0.1, 0.6),
               ncol = 4)

viewSplines(knots, degree = 2, theta2)



