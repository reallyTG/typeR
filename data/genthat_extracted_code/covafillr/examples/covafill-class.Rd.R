library(covafillr)


### Name: covafill-class
### Title: A Reference Class for Local Polynomial Regression with covafill.
### Aliases: covafill-class covafill

### ** Examples

getRefClass('covafill')
fn <- function(x) x ^ 4 - x ^ 2
x <- runif(2000,-3,3)
y <- fn(x) + rnorm(2000,0,0.1)
cf <- covafill(coord = x,obs = y,p = 5L)
cf$getDim()
cf$getDegree()
cf$getBandwith()
x0 <- seq(-1,1,0.1)
y0 <- cf$predict(x0)
par(mfrow=c(3,1))
plot(x0,y0[,1], main = "Function")
lines(x0,fn(x0))
plot(x0, y0[,2], main = "First derivative")
lines(x0, 4 * x0 ^ 3 - 2 * x0)
plot(x0, y0[,3], main = "Second derivative")
lines(x0, 3 * 4 * x0 ^ 2 - 2)
cf$setBandwith(1.0)
cf$getBandwith()




