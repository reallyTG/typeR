library(llama)


### Name: parscores
### Title: Penalized average runtime score
### Aliases: parscores
### Keywords: models

### ** Examples

if(Sys.getenv("RUN_EXPENSIVE") == "true") {
data(satsolvers)
folds = cvFolds(satsolvers)

model = classify(classifier=makeLearner("classif.J48"), data=folds)
sum(parscores(folds, model))

# use factor of 5 instead of 10.
sum(parscores(folds, model, 5))

# explicitly specify timeout.
sum(parscores(folds, model, timeout = 3600))
}



