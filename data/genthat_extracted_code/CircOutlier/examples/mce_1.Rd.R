library(CircOutlier)


### Name: MCe
### Title: Detection of Outliers in Circular-circular Regression
### Aliases: MCe

### ** Examples

# Generate a data set dependent of circular variables.
library(CircStats)
 x <- rvm(n = 50, 0, 2)
y <- rvm(n = 50, pi/4, 5)
# Fit a circular-circular regression model.
circ.lm <- circ.reg(x, y, order = 1)
Y <- circ.lm$fitted
MCe(cos(y - Y))



