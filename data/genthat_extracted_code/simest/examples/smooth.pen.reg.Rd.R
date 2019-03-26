library(simest)


### Name: smooth.pen.reg
### Title: Penalized Smooth/Smoothing Spline Regression.
### Aliases: smooth.pen.reg smooth.pen.reg.default plot.smooth.pen.reg
###   predict.smooth.pen.reg print.smooth.pen.reg
### Keywords: Smoothing Splines Penalized Least Squares

### ** Examples

args(smooth.pen.reg)
x <- runif(50,-1,1)
y <- x^2 + rnorm(50,0,0.3)
tmp <- smooth.pen.reg(x, y, lambda = 0.01, agcv = TRUE)
print(tmp)
plot(tmp)
predict(tmp, newdata = rnorm(10,0,0.1))



