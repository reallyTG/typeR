library(rqPen)


### Name: coef.cv.rq.pen
### Title: Penalized Quantile Regression Coefficients
### Aliases: coef.cv.rq.pen

### ** Examples

x <- matrix(rnorm(800),nrow=100)
y <- 1 + x[,1] - 3*x[,5] + rnorm(100)
cv_model <- cv.rq.pen(x,y)
coefficients(cv_model)



