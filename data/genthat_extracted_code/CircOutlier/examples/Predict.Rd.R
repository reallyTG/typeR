library(CircOutlier)


### Name: Predict
### Title: Estimates of Parameters in Circular-Circular Regression
### Aliases: Predict

### ** Examples

# Generate a data set dependent of circular variables.
library(CircStats)
x <- rvm(n = 50, 0, 2)
y <- rvm(n = 50, pi/4, 5)
Predict(x, y)



