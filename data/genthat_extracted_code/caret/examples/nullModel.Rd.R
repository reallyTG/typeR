library(caret)


### Name: nullModel
### Title: Fit a simple, non-informative model
### Aliases: nullModel nullModel.default predict.nullModel
### Keywords: models

### ** Examples


outcome <- factor(sample(letters[1:2],
                         size = 100,
                         prob = c(.1, .9),
                         replace = TRUE))
useless <- nullModel(y = outcome)
useless
predict(useless, matrix(NA, nrow = 10))





