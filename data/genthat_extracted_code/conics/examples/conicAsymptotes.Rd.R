library(conics)


### Name: conicAsymptotes
### Title: Asymptotes of a conic
### Aliases: conicAsymptotes
### Keywords: conics, matrix, asymptotes

### ** Examples

# Hyperbola
# Equation: 2*x_1^2 + 2*x_1*x_2 - 2*x_2^2 - 20*x_1 + 20*x_2 + 10 = 0
v <- c(2,2,-2,-20,20,10)
conicAsymptotes(v)

# Ellipse
# Equation: 2*x_1^2 + 2*x_1*x_2 + 2*x_2^2 - 20*x_1 - 28*x_2 + 10 = 0
v <- c(2,2,2,-20,-28,10)
# Should return an empty vector (an ellipse has no asymptotes!):
conicAsymptotes(v)




