library(ipred)


### Name: predict.classbagg
### Title: Predictions from Bagging Trees
### Aliases: predict.classbagg predict.regbagg predict.survbagg
### Keywords: tree

### ** Examples


data("Ionosphere", package = "mlbench")
Ionosphere$V2 <- NULL # constant within groups

# nbagg = 10 for performance reasons here
mod <- bagging(Class ~ ., data=Ionosphere)

# out-of-bag estimate

mean(predict(mod) != Ionosphere$Class)

# predictions for the first 10 observations

predict(mod, newdata=Ionosphere[1:10,])

predict(mod, newdata=Ionosphere[1:10,], type="prob")




