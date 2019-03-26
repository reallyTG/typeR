library(covafillr)


### Name: covatree-class
### Title: A Reference Class for Search Tree Approximated Local Polynomial
###   Regression with covatree.
### Aliases: covatree-class covatree

### ** Examples

getRefClass('covatree')
fn <- function(x) x ^ 4 - x ^ 2
x <- runif(2000,-3,3)
y <- fn(x) + rnorm(2000,0,0.1)
ct <- covatree(coord = x,obs = y,p = 5L, minLeft = 50)
ct$getDim()
x0 <- seq(-1,1,0.1)
y0 <- ct$predict(x0)
par(mfrow=c(2,1))
plot(x0,y0[,1], main = "Function")
lines(x0,fn(x0))
plot(x0, y0[,2], main = "First derivative")
lines(x0, 4 * x0 ^ 3 - 2 * x0)




