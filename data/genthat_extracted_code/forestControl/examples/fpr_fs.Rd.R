library(forestControl)


### Name: fpr_fs
### Title: False Postivie Rate Feature Selection
### Aliases: fpr_fs

### ** Examples

library(randomForest)
data(iris)
iris.rf <- randomForest(iris[,-5], iris[,5], forest = TRUE)

iris.features <- fpr_fs(iris.rf)
print(iris.features)



