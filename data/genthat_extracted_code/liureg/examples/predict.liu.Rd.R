library(liureg)


### Name: predict.liu
### Title: Predict Method for Liu Regression Model Fits
### Aliases: predict predict.liu
### Keywords: Liu Model Prediction

### ** Examples

mod <- liu(y~., data = as.data.frame(Hald), d = seq(-5, 5, 0.1))
predict(mod)

predict(mod, newdata=as.data.frame(Hald[1:5, -1]))



