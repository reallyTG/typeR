library(ridge)


### Name: logisticRidge
### Title: Logistic ridge regression.
### Aliases: logisticRidge coef.ridgeLogistic plot.ridgeLogistic
###   predict.ridgeLogistic print.ridgeLogistic summary.ridgeLogistic
###   print.summary.ridgeLogistic

### ** Examples

data(GenBin)
mod <- logisticRidge(Phenotypes ~ ., data = as.data.frame(GenBin))
summary(mod)



