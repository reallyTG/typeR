library(lmridge)


### Name: predict.lmridge
### Title: Predict method for Linear Ridge Model Fits
### Aliases: predict predict.lmridge
### Keywords: ridge model predictions

### ** Examples

mod <- lmridge(y~., as.data.frame(Hald), K = seq(0, 0.2, 0.05))
predict(mod)
predict(mod, newdata = as.data.frame(Hald[1:5, -1]))



