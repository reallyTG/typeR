library(EZtune)


### Name: eztune.cv
### Title: Cross-Validated Accuracy for Supervised Learning Model
### Aliases: eztune.cv
### Keywords: adaboost, cross-validation gbm, svm, tuning,

### ** Examples

library(mlbench)
data(Glass)

glass <- Glass[as.numeric(as.character(Glass$Type)) < 3, ]
glass <- glass[sample(1:nrow(glass), 80), ]
y <- ifelse(glass$Type == 1, 0, 1)
x <- glass[, 1:9]

glass_svm <- eztune(x, y, type = "binary", method = "svm")
eztune.cv(x, y, glass_svm)




