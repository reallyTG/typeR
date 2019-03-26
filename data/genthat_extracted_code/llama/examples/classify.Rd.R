library(llama)


### Name: classify
### Title: Classification model
### Aliases: classify
### Keywords: models

### ** Examples

if(Sys.getenv("RUN_EXPENSIVE") == "true") {
data(satsolvers)
folds = cvFolds(satsolvers)

res = classify(classifier=makeLearner("classif.J48"), data=folds)
# the total number of successes
sum(successes(folds, res))
# predictions on the entire data set
res$predictor(satsolvers$data[satsolvers$features])

res = classify(classifier=makeLearner("classif.svm"), data=folds)

# use probabilities instead of labels
res = classify(classifier=makeLearner("classif.randomForest", predict.type = "prob"), data=folds)

# ensemble classification
rese = classify(classifier=list(makeLearner("classif.J48"),
                                makeLearner("classif.IBk"),
                                makeLearner("classif.svm")),
                data=folds)

# ensemble classification with a classifier to combine predictions
rese = classify(classifier=list(makeLearner("classif.J48"),
                                makeLearner("classif.IBk"),
                                makeLearner("classif.svm"),
                                .combine=makeLearner("classif.J48")),
                data=folds)
}



