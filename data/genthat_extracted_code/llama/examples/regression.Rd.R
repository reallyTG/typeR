library(llama)


### Name: regression
### Title: Regression model
### Aliases: regression
### Keywords: regression

### ** Examples

if(Sys.getenv("RUN_EXPENSIVE") == "true") {
data(satsolvers)
folds = cvFolds(satsolvers)

res = regression(regressor=makeLearner("regr.lm"), data=folds)
# the total number of successes
sum(successes(folds, res))
# predictions on the entire data set
res$predictor(satsolvers$data[satsolvers$features])

res = regression(regressor=makeLearner("regr.ksvm"), data=folds)

# combine performance predictions using classifier
ress = regression(regressor=makeLearner("regr.ksvm"),
                  data=folds,
                  combine=makeLearner("classif.J48"))

# add pairwise differences to performance predictions before running classifier
ress = regression(regressor=makeLearner("regr.ksvm"),
                  data=folds,
                  combine=makeLearner("classif.J48"),
                  expand=function(x) { cbind(x, combn(c(1:ncol(x)), 2,
                         function(y) { abs(x[,y[1]] - x[,y[2]]) })) })
}



