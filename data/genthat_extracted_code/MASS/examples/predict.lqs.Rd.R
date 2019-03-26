library(MASS)


### Name: predict.lqs
### Title: Predict from an lqs Fit
### Aliases: predict.lqs
### Keywords: models

### ** Examples

set.seed(123)
fm <- lqs(stack.loss ~ ., data = stackloss, method = "S", nsamp = "exact")
predict(fm, stackloss)



