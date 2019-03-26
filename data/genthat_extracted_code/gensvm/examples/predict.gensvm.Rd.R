library(gensvm)


### Name: predict.gensvm
### Title: Predict class labels with the GenSVM model
### Aliases: predict.gensvm

### ** Examples

x <- iris[, -5]
y <- iris[, 5]

# create a training and test sample
attach(gensvm.train.test.split(x, y))
fit <- gensvm(x.train, y.train)

# predict the class labels of the test sample
y.test.pred <- predict(fit, x.test)

# compute the accuracy with gensvm.accuracy
gensvm.accuracy(y.test, y.test.pred)




