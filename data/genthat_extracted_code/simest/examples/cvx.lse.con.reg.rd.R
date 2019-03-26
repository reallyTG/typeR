library(simest)


### Name: cvx.lse.con.reg
### Title: Convex Least Squares Regression.
### Aliases: cvx.lse.con.reg cvx.lse.con.reg.default
### Keywords: Convex Least Squares Cone Projection

### ** Examples

args(cvx.lse.con.reg)
x <- runif(50,-1,1)
y <- x^2 + rnorm(50,0,0.3)
tmp <- cvx.lse.con.reg(x, y)
print(tmp)
plot(tmp)
predict(tmp, newdata = rnorm(10,0,0.1))



