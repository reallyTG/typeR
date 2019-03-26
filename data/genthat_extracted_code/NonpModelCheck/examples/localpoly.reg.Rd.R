library(NonpModelCheck)


### Name: localpoly.reg
### Title: Local Polynomial Regression Fitting
### Aliases: localpoly.reg
### Keywords: ~kwd1 ~kwd2

### ** Examples

X = rnorm(100)
Y = X^3 + rnorm(100)

localpoly.reg(X, Y, degree.pol = 0, kernel.type = "box",
 bandwidth = "CV")
localpoly.reg(X, Y, degree.pol = 1, kernel.type = "box",
 bandwidth = "CV")
##--
X = runif(100,-3,3)
Y = sin(1/2*pi*X) + rnorm(100,0,.5)

localpoly.reg(X, Y, degree.pol = 0, kernel.type = "gaussian",
  bandwidth = "CV")
localpoly.reg(X, Y, degree.pol = 1, kernel.type = "gaussian", 
  bandwidth = "CV")



