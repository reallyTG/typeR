library(klaR)


### Name: predict.sknn
### Title: Simple k Nearest Neighbours Classification
### Aliases: predict.sknn
### Keywords: classif

### ** Examples

data(iris)
x <- sknn(Species ~ ., data = iris)
predict(x, iris)
x <- sknn(Species ~ ., gamma = 10, kn = 10, data = iris)
predict(x, iris)



