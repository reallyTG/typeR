library(iml)


### Name: Predictor
### Title: Predictor object
### Aliases: Predictor

### ** Examples

if (require("mlr")) {
task = makeClassifTask(data = iris, target = "Species")
learner = makeLearner("classif.rpart", minsplit = 7, predict.type = "prob")
mod.mlr = train(learner, task)
mod = Predictor$new(mod.mlr, data = iris)
mod$predict(iris[1:5,])

mod = Predictor$new(mod.mlr, data = iris, class = "setosa")
mod$predict(iris[1:5,])
}

if (require("randomForest")) {
rf = randomForest(Species ~ ., data = iris, ntree = 20)


mod = Predictor$new(rf, data = iris, type = "prob")
mod$predict(iris[50:55,])

# Feature importance needs the target vector, which needs to be supplied: 
mod = Predictor$new(rf, data = iris, y = "Species", type = "prob")
}



