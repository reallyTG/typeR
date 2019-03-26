library(cobs)


### Name: drqssbc2
### Title: Regression Quantile Smoothing Spline with Constraints
### Aliases: drqssbc2
### Keywords: smooth utilities

### ** Examples

set.seed(1243)
x  <- 1:32
fx <- (x-5)*(x-15)^2*(x-21)
y  <- fx + round(rnorm(x,s = 0.25),2)



