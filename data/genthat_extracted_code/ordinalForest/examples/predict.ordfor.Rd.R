library(ordinalForest)


### Name: predict.ordfor
### Title: Prediction using ordinal forest objects
### Aliases: predict.ordfor

### ** Examples

data(hearth)

set.seed(123)
trainind <- sort(sample(1:nrow(hearth), size=floor(nrow(hearth)*(1/2))))
testind <- sort(sample(setdiff(1:nrow(hearth), trainind), size=20))

datatrain <- hearth[trainind,]
datatest <- hearth[testind,]

ordforres <- ordfor(depvar="Class", data=datatrain, nsets=60, nbest=5)
# NOTE: nsets=60 is not enough, because the prediction performance of the resulting 
# ordinal forest will be suboptimal!! In practice, nsets=1000 (default value) or a larger
# number should be used.

preds <- predict(ordforres, newdata=datatest)
preds
 
table(data.frame(true_values=datatest$Class, predictions=preds$ypred))

head(preds$classfreqtree)




