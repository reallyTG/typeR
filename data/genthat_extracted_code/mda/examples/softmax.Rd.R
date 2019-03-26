library(mda)


### Name: softmax
### Title: Find the Maximum in Each Row of a Matrix
### Aliases: softmax
### Keywords: utilities

### ** Examples

data(iris)
irisfit <- fda(Species ~ ., data = iris)
posteriors <- predict(irisfit, type = "post")
confusion(softmax(posteriors), iris[, "Species"])



