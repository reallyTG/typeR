library(llama)


### Name: llama-package
### Title: Leveraging Learning to Automatically Manage Algorithms
### Aliases: llama-package llama
### Keywords: package

### ** Examples

if(Sys.getenv("RUN_EXPENSIVE") == "true") {
data(satsolvers)
folds = cvFolds(satsolvers)

model = classify(classifier=makeLearner("classif.J48"), data=folds)
# print the total number of successes
print(sum(successes(folds, model)))
# print the total misclassification penalty
print(sum(misclassificationPenalties(folds, model)))
# print the total PAR10 score
print(sum(parscores(folds, model)))

# number of total successes for virtual best solver for comparison
print(sum(successes(satsolvers, vbs, addCosts = FALSE)))

# print predictions on the entire data set
print(model$predictor(subset(satsolvers$data, TRUE, satsolvers$features)))

# train a regression model
model = regression(regressor=makeLearner("regr.lm"), data=folds)
# print the total number of successes
print(sum(successes(folds, model)))
}



