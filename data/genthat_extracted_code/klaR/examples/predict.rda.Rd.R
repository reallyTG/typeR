library(klaR)


### Name: predict.rda
### Title: Regularized Discriminant Analysis (RDA)
### Aliases: predict.rda
### Keywords: multivariate

### ** Examples

data(iris)
x <- rda(Species ~ ., data = iris, gamma = 0.05, lambda = 0.2)
predict(x, iris[, 1:4])



