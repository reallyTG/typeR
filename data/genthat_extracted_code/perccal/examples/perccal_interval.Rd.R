library(perccal)


### Name: perccal_interval
### Title: Calculates Percentile-Calibrated Linear Regression Confidence
###   Intervals
### Aliases: perccal_interval

### ** Examples

set.seed(1234)
n = 32
B = 500
B2 = 500
G=20
x1=rnorm(n)
x2=rnorm(n)
eps=rnorm(n)
y = x1 + 2*x2 + eps
Xy = cbind(x1,x2,y)
alpha = .025
perccal_interval(Xy, alpha, G, B, B2)



