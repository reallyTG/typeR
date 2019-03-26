library(llama)


### Name: misclassificationPenalties
### Title: Misclassification penalty
### Aliases: misclassificationPenalties
### Keywords: models

### ** Examples

if(Sys.getenv("RUN_EXPENSIVE") == "true") {
data(satsolvers)
folds = cvFolds(satsolvers)

model = classify(classifier=makeLearner("classif.J48"), data=folds)
sum(misclassificationPenalties(folds, model))
}



