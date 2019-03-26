library(klaR)


### Name: rda
### Title: Regularized Discriminant Analysis (RDA)
### Aliases: rda rda.default rda.formula plot.rda print.rda
### Keywords: multivariate

### ** Examples

data(iris)
x <- rda(Species ~ ., data = iris, gamma = 0.05, lambda = 0.2)
predict(x, iris)



