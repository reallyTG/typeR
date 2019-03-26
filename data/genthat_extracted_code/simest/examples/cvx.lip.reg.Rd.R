library(simest)


### Name: cvx.lip.reg
### Title: Convex Least Squares Regression with Lipschitz Constraint
### Aliases: cvx.lip.reg cvx.lip.reg.default plot.cvx.lip.reg
###   predict.cvx.lip.reg print.cvx.lip.reg
### Keywords: Convex Least Squares Least Distance Programming Non-negative
###   Least Squares

### ** Examples

args(cvx.lip.reg)
x <- runif(50,-1,1)
y <- x^2 + rnorm(50,0,0.3)
tmp <- cvx.lip.reg(x, y, L = 10)
print(tmp)
plot(tmp)
predict(tmp, newdata = rnorm(10,0,0.1))



