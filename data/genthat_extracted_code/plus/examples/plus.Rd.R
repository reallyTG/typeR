library(plus)


### Name: plus
### Title: Fits linear regression with a quadratic spline penalty,
###   including the Lasso, MC+ and SCAD.
### Aliases: plus
### Keywords: regression

### ** Examples

data(sp500)
attach(sp500)
x <- sp500.percent[,3: (dim(sp500.percent)[2])] 
y <- sp500.percent[,1]

par(mfrow=c(2,3))
object <- plus(x,y,method="lasso")
plot(object)
plot(object, yvar="dim")
plot(object, yvar="R-sq")
object <- plus(x,y,method="mc+")
plot(object)
plot(object, yvar="dim")
plot(object, yvar="R-sq")
detach(sp500)



