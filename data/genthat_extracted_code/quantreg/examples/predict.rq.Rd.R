library(quantreg)


### Name: predict.rq
### Title: Quantile Regression Prediction
### Aliases: predict.rq predict.rqs predict.rq.process
### Keywords: regression

### ** Examples

data(airquality)
airq <- airquality[143:145,]
f <- rq(Ozone ~ ., data=airquality)
predict(f,newdata=airq)
f <- rq(Ozone ~ ., data=airquality, tau=1:19/20)
fp <- predict(f, newdata=airq, stepfun = TRUE)
fpr <- rearrange(fp)
plot(fp[[2]],main = "Conditional Ozone Quantile Prediction")
lines(fpr[[2]], col="red")
legend(.2,20,c("raw","cooked"),lty = c(1,1),col=c("black","red"))
fp <- predict(f, newdata=airq, type = "Fhat", stepfun = TRUE)
fpr <- rearrange(fp)
plot(fp[[2]],main = "Conditional Ozone Distribution Prediction")
lines(fpr[[2]], col="red")
legend(20,.4,c("raw","cooked"),lty = c(1,1),col=c("black","red"))
  


