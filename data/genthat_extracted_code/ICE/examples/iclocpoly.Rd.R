library(ICE)


### Name: iclocpoly
### Title: Interval-Censored Local Polynomial Regression Estimation
### Aliases: iclocpoly
### Keywords: models

### ** Examples

library(KernSmooth)
data(motor.IC)
estimate <- iclocpoly(x=motor.IC$V1, y.IC = cbind(motor.IC$y.L, 
motor.IC$y.R), degree=0, h=1)
plot(motor.IC$V1, motor.IC$V2)
lines(locpoly(estimate$x, estimate$y, bandwidth=1, degree=0),col=4)



