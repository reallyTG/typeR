library(bigsplines)


### Name: predict.ordspline
### Title: Predicts for "ordspline" Objects
### Aliases: predict.ordspline

### ** Examples


##########   EXAMPLE   ##########

# define univariate function and data
set.seed(773)
myfun <- function(x){ 2 + x/2 + sin(x) }
x <- sample(1:20, size=500, replace=TRUE)
y <- myfun(x) + rnorm(500)

# fit ordinal spline model
ordmod <- ordspline(x, y)
monmod <- ordspline(x, y, monotone=TRUE)
crossprod( predict(ordmod) - myfun(x) ) / 500
crossprod( predict(monmod) - myfun(x) ) / 500

# plot truth and predictions
ordfit <- predict(ordmod, 1:20, se.fit=TRUE)
monfit <- predict(monmod, 1:20, se.fit=TRUE)
plotci(1:20, ordfit$fit, ordfit$se.fit, ylab="f(x)")
plotci(1:20, monfit$fit, monfit$se.fit, col="red", col.ci="pink", add=TRUE)
points(1:20, myfun(1:20))




