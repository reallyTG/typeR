library(conics)


### Name: conicAxes
### Title: Axes of a conic
### Aliases: conicAxes
### Keywords: conics, matrix, axes

### ** Examples

# Ellipse
# Equation: 2*x_1^2 + 2*x_1*x_2 + 2*x_2^2 - 20*x_1 - 28*x_2 + 10 = 0
v <- c(2,2,2,-20,-28,10)
conicAxes(v)

# Hyperbola
# Equation: 2*x_1^2 + 2*x_1*x_2 - 2*x_2^2 - 20*x_1 + 20*x_2 + 10 = 0
v <- c(2,2,-2,-20,20,10)
conicAxes(v)



