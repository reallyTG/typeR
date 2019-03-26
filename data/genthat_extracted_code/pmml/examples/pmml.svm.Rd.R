library(pmml)


### Name: pmml.svm
### Title: Generate PMML for svm objects
### Aliases: pmml.svm

### ** Examples


library(e1071)
fit <- svm(Species ~ ., data=iris, kernel="polynomial")
pmml(fit)

rm(fit)




