library(EZtune)


### Name: eztune
### Title: Supervised Learning Function
### Aliases: eztune
### Keywords: adaboost, gbm, svm, tuning

### ** Examples

library(mlbench)
data(Glass)

glass <- Glass[as.numeric(as.character(Glass$Type)) < 3, ]
glass <- glass[sample(1:nrow(glass), 80), ]
y <- ifelse(glass$Type == 1, 0, 1)
x <- glass[, 1:9]

eztune(x, y, type = "binary", method = "gbm", optimizer = "optim")




