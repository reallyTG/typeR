library(CircOutlier)


### Name: MCE
### Title: Detection of Outliers in Circular-Circular Regression
### Aliases: MCE

### ** Examples

#Generate a data set dependent of circular variables.
library(CircStats)
n <- 50
x <- rvm(n = 50, 0, 2)
y <- rvm(n = 50, pi/4, 5)
# Fit a circular-circular regression model.
circ.lm <- circ.reg(x, y, order = 1)
Y <- circ.lm$fitted
MCE(y, Y, n)



