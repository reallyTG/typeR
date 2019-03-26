library(rqPen)


### Name: predict.cv.rq.pen
### Title: Prediction from a cv quantile regression penalized model
### Aliases: predict.cv.rq.pen

### ** Examples

x <- matrix(rnorm(800),nrow=100)
y <- 1 + x[,1] - 3*x[,5] + rnorm(100)
cv_model <- cv.rq.pen(x,y)
n2 <- matrix(rnorm(80),nrow=10)
preds <- predict(cv_model,n2)



