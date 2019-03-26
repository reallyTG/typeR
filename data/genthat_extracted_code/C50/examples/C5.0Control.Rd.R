library(C50)


### Name: C5.0Control
### Title: Control for C5.0 Models
### Aliases: C5.0Control
### Keywords: models

### ** Examples


data(churn)

treeModel <- C5.0(x = churnTrain[, -20], 
                  y = churnTrain$churn,
                  control = C5.0Control(winnow = TRUE))
summary(treeModel)




