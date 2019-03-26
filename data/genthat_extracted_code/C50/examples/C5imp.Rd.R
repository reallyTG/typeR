library(C50)


### Name: C5imp
### Title: Variable Importance Measures for C5.0 Models
### Aliases: C5imp
### Keywords: models

### ** Examples


data(churn)

treeModel <- C5.0(x = churnTrain[, -20], y = churnTrain$churn)
C5imp(treeModel)
C5imp(treeModel, metric = "splits")




