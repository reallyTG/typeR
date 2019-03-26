library(simest)


### Name: cvx.pen.reg
### Title: Penalized Smooth Convex Regression.
### Aliases: cvx.pen.reg cvx.pen.reg.default plot.cvx.pen.reg
###   predict.cvx.pen.reg print.cvx.pen.reg
### Keywords: Penalized Least Squares

### ** Examples

args(cvx.pen.reg)
x <- runif(50,-1,1)
y <- x^2 + rnorm(50,0,0.3)
tmp <- cvx.pen.reg(x, y, lambda = 0.01)
print(tmp)
plot(tmp)
predict(tmp, newdata = rnorm(10,0,0.1))



