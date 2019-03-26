library(llama)


### Name: regressionPairs
### Title: Regression model for pairs of algorithms
### Aliases: regressionPairs
### Keywords: models

### ** Examples

if(Sys.getenv("RUN_EXPENSIVE") == "true") {
data(satsolvers)
folds = cvFolds(satsolvers)

model = regressionPairs(regressor=makeLearner("regr.lm"), data=folds)
# the total number of successes
sum(successes(folds, model))
# predictions on the entire data set
model$predictor(satsolvers$data[satsolvers$features])

# combine predictions using J48 induced classifier
model = regressionPairs(regressor=makeLearner("regr.lm"), data=folds,
    combine=makeLearner("classif.J48"))
}



