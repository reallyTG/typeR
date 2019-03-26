library(klaR)


### Name: sknn
### Title: Simple k nearest Neighbours
### Aliases: sknn sknn.default sknn.formula sknn.matrix sknn.data.frame
### Keywords: classif

### ** Examples

data(iris)
x <- sknn(Species ~ ., data = iris)
x <- sknn(Species ~ ., gamma = 4, data = iris)



