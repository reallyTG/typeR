library(conics)


### Name: conicCenter
### Title: Center of a conic
### Aliases: conicCenter
### Keywords: conics, matrix, center

### ** Examples

# Ellipse
# Equation: 2*x_1^2 + 2*x_1*x_2 + 2*x_2^2 - 20*x_1 - 28*x_2 + 10 = 0
v <- c(2,2,2,-20,-28,10)
conicCenter(v)

# Hyperbola
# Equation: 2*x_1^2 + 2*x_1*x_2 - 2*x_2^2 - 20*x_1 + 20*x_2 + 10 = 0
v <- c(2,2,-2,-20,20,10)
conicCenter(v)



