library(ebmc)


### Name: ub
### Title: Implementation of UnderBagging
### Aliases: ub

### ** Examples

data("iris")
iris <- iris[1:70, ]
iris$Species <- factor(iris$Species, levels = c("setosa", "versicolor"), labels = c("0", "1"))
model1 <- ub(Species ~ ., data = iris, size = 10, alg = "c50", ir = 1)
model2 <- ub(Species ~ ., data = iris, size = 20, alg = "rf", ir = 1, rf.ntree = 100)
model3 <- ub(Species ~ ., data = iris, size = 40, alg = "svm", ir = 1, svm.ker = "sigmoid")



