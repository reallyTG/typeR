library(rqPen)


### Name: predict.rq.pen
### Title: Prediction from a quantile regression penalized model
### Aliases: predict.rq.pen

### ** Examples

x <- matrix(rnorm(800),nrow=100)
y <- 1 + x[,1] - 3*x[,5] + rnorm(100)
lassoModel <- rq.lasso.fit(x,y,lambda=1)
n2 <- matrix(rnorm(80),nrow=10)
preds <- predict(lassoModel,n2)



