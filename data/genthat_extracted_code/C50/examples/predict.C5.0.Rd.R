library(C50)


### Name: predict.C5.0
### Title: Predict new samples using a C5.0 model
### Aliases: predict.C5.0
### Keywords: models

### ** Examples


data(churn)

treeModel <- C5.0(x = churnTrain[, -20], y = churnTrain$churn)
predict(treeModel, head(churnTest[, -20]))
predict(treeModel, head(churnTest[, -20]), type = "prob")





