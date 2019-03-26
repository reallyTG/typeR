library(plot3logit)


### Name: effect
### Title: Draw a change in the probability distribution on an existing
###   plot
### Aliases: effect
### Keywords: internal

### ** Examples

TernaryPlot()

# Arrow
plot3logit:::effect(c(0.1, 0.2), c(0.3, 0.2))

# Point
plot3logit:::effect(0.3, 0.2)

# Compare the two coordinate systems
plot3logit:::effect(0.1, 0.2, pch = 19, col = 'red')
AddToTernary(plot3logit:::effect, list(c(0.1, 0.2, 0.7)), pch = 19, col = 'blue')

# The origin of Cartesian coordinate systems
plot3logit:::effect(0, 0, pch = 19, col = 'red')
AddToTernary(plot3logit:::effect, list(c(0, 0.5, 0.5)), pch = '+', col = 'white')




