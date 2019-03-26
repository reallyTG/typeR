library(llama)


### Name: classifyPairs
### Title: Classification model for pairs of algorithms
### Aliases: classifyPairs
### Keywords: models

### ** Examples

if(Sys.getenv("RUN_EXPENSIVE") == "true") {
data(satsolvers)
folds = cvFolds(satsolvers)

res = classifyPairs(classifier=makeLearner("classif.J48"), data=folds)
# the total number of successes
sum(successes(folds, res))
# predictions on the entire data set
res$predictor(satsolvers$data[satsolvers$features])

# use probabilities instead of labels
res = classifyPairs(classifier=makeLearner("classif.randomForest",
                                predict.type = "prob"), data=folds)

# combine predictions using J48 induced classifier instead of majority vote
res = classifyPairs(classifier=makeLearner("classif.J48"),
                    data=folds,
                    combine=makeLearner("classif.J48"))
}



