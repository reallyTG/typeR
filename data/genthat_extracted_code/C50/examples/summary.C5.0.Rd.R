library(C50)


### Name: summary.C5.0
### Title: Summaries of C5.0 Models
### Aliases: summary.C5.0
### Keywords: models

### ** Examples


data(churn)

treeModel <- C5.0(x = churnTrain[, -20], y = churnTrain$churn)
summary(treeModel)




