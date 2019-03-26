library(simest)


### Name: cvx.lse.reg
### Title: Convex Least Squares Regression.
### Aliases: cvx.lse.reg cvx.lse.reg.default plot.cvx.lse.reg
###   predict.cvx.lse.reg print.cvx.lse.reg
### Keywords: Convex Least Squares Cone Projection

### ** Examples

args(cvx.lse.reg)
x <- runif(50,-1,1)
y <- x^2 + rnorm(50,0,0.3)
tmp <- cvx.lse.reg(x, y)
print(tmp)
plot(tmp)
predict(tmp, newdata = rnorm(10,0,0.1))



