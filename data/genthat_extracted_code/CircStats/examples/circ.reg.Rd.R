library(CircStats)


### Name: circ.reg
### Title: Circular-Circular Regression
### Aliases: circ.reg
### Keywords: models

### ** Examples

# Generate a data set of dependent circular variables.
data1 <- runif(50, 0, 2*pi)
data2 <- atan2(0.15*cos(data1) + 0.25*sin(data1), 0.35*sin(data1)) + rvm(50, 0, 5)

# Fit a circular regression model.
circ.lm <- circ.reg(data1, data2, order=1)
# Obtain a crude plot a data and fitted regression line.
plot(data1, data2)
circ.lm$fitted[circ.lm$fitted>pi] <- circ.lm$fitted[circ.lm$fitted>pi] - 2*pi 

points(data1[order(data1)], circ.lm$fitted[order(data1)], type='l')



